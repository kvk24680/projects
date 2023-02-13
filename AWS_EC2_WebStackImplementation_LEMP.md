<h3> Web Stack Implementation using LEMP Stack </h3>

<h5>LAMP vs LEMP</h5>

The difference is just in the web server software used. With a LAMP stack the web server used is Apache, whereas with a LEMP stack environment the web server used is Nginx (Engine X). Both web servers operate differently, and require different configurations to set them up.

We need an AWS EC2 instance to execute this project. Once created, SSH and follow up with the instructions.

<h5> Installing NGINX Web Server </h5> 

```bash
sudo apt update

sudo apt install nginx

sudo systemctl status nginx
```

<h6>Check if NGINX is working (both from the VM and the browser</h6>

```bash
curl localhost:80

curl http://<InstanceIP>:80
```

<h5>Installing MySQL and completing setup</h5>

```bash
sudo apt install mysql-server

sudo mysql
```

Once completed, execute the following commands as queries in MySQL. 

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'p@ssword32';

exit
```

In the above command we set a password for the **root** user, using **mysql_native_password** as **default authentication method**. We’re defining this user’s password as `p@ssword32`.

<h6>Run the recommended SQL interactive script</h6>

```bash
sudo mysql_secure_installation
```

```sql
> exit
```

<h5>Install PHP</h5>

```bash
sudo apt install php-fpm php-mysql -y
```

<h5>Configuring Nginx to use PHP Processor</h5>

Like we use **virtual hosts** in Apache, we use **server blocks** for **nginx** and to host more than 1 domain for on a single server.

<h6>Create a separate directory structure for your domain instead of default one (/var/www/html) + Change Directory Permissions</h6>
------
------
```bash
sudo mkdir /var/www/mylempsite

sudo chown -R $USER:$USER /var/www/mylempsite

sudo vi /etc/nginx/sites-available/mylempsite
```

```vim
#/etc/nginx/sites-available/mylempsite

server {

    // default HTTP nginx listens on
    
    listen 80;  
    
    // Domain names and/or IP addresses this server block should respond for i.e our server's domain name or IP Address

    server_name mylempsite www.mylempsite; 
    
    // document root
    
    root /var/www/mylempsite;   
    
    // Order in which Nginx will prioritize index files for this website

    index index.html index.htm index.php;   

    // The first location block includes a try_files directive, which checks for the existence of files or directories matching a URI request. If Nginx cannot find the appropriate resource, it will return a 404 error.

    location / {
        try_files $uri $uri/ =404;
    }

    // Handles the actual PHP processing by pointing Nginx to the fastcgi-php.conf configuration file and the php7.4-fpm.sock file, which declares what socket is associated with php-fpm.

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
     }

    // The last location block deals with .htaccess files, which Nginx does not process. By adding the deny all directive, if any .htaccess files happen to find their way into the document root ,they will not be served to visitors.

    location ~ /\.ht {
        deny all;
    }
}
```

<h5>Activate and test nginx configuration</h5>

``` bash
sudo ln -s /etc/nginx/sites-available/mylempsite /etc/nginx/sites-enabled/

sudo nginx -t
```

<h5>Disable default nginx host and reload</h5>

```bash
sudo unlink /etc/nginx/sites-enabled/default

sudo systemctl reload nginx
```

<h5>See if the site gives a response from the terminal </h5>

```bash
sudo echo 'Hello LEMP from hostname' $(curl -s http://169.254.169.254/latest/meta-data/public-hostname) 'with public IP'
$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4) > /var/www/mylempsite/index.html
```

<h6>Test it from a browser</h6>

```vim
http://<Public-IP-Address>:80

http://<Public-DNS-Name>:80
```

The LEMP stack is now fully configured. 

<h5>Create a test PHP file in the document root</h5>

```bash
sudo vi /var/www/mylempsite/info.php
```
```php
<?php
phpinfo();
```

<h5>Test it</h5>

```bash
curl <Server Domain or IP>/info.php
```

![PHP HomePage](https://i1.wp.com/www.sumonselim.com/wp-content/uploads/2014/10/66253f7f058e5c326cafc83d6c90999d.png?w=968&ssl=1 "PHP Home Page")

<h5>Remove the PHP file</h5>
It is recommended to remove the PHP index file as it contains sensitive information.
```bash
sudo rm /var/www/projectlamp/index.php
```

---

<h5>RETRIEVING DATA FROM MYSQL DATABASE WITH PHP</h5>

At the time of this writing, the native MySQL PHP library mysqlnd doesn’t support **caching_sha2_authentication**, the default authentication method for **MySQL** **8**. We’ll need to create a new user with the **mysql_native_password** authentication method in order to be able to connect to the MySQL database from PHP.

<br>

<h5>Connect to MySQL console</h5>

```bash
sudo mysql
```

Use a stronger password.

```sql
// create DB

CREATE DATABASE db1;

// create user using mysql_native_password as default authentication method

CREATE USER 'user1'@'%' IDENTIFIED WITH mysql_native_password BY 'password';

// grant db access to new user

GRANT ALL ON db1.* TO 'user1'@'%';

exit
```

<h6>Test new credentials</h6>

```bash
mysql -u user1 -p
```
```sql
SHOW DATABASES;
```

<h5>Table Operations</h5>

```sql

// Create table

CREATE TABLE db1.todo_list (
     item_id INT AUTO_INCREMENT,
     content VARCHAR(255),
     PRIMARY KEY(item_id)
 );

// Insert values in table

INSERT INTO db1.todo_list (content) VALUES ("My first important item");

// Confirm if values exist

SELECT * FROM db1.todo_list;

exit
```

<h5>PHP script that will connect to MySQL and query for content</h5>

```bash
vi /var/www/lempsite/todo_list.php
```
```php
<?php
$user = "user1";
$password = "password";
$database = "db1";
$table = "todo_list";

try {
  $db = new PDO("mysql:host=localhost;dbname=$database", $user, $password);
  echo "<h2>TODO</h2><ol>";
  foreach($db->query("SELECT content FROM $table") as $row) {
    echo "<li>" . $row['content'] . "</li>";
  }
  echo "</ol>";
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
```
<h5>Try Accessing the web page</h5>
```bash
http://<Public_domain_or_IP>/todo_list.php
```
