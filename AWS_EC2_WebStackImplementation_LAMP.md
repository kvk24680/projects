## Web Stack Implementation using LAMP Stack ##

<h3> Create a Security Group </h3> 

Create a security group allowing all internet access `0.0.0.0/0` in the inbound rule.

<h3> Create an EC2 instance </h3> 

1. Create a t3.micro EC2 instance having Ubuntu as the AMI.
2. Set the name to anything relevant such as `LAMP instance`.
3. Create a new key pair and save it. 
4. Select the existing security group that we selected earlier.
5. Launch the instance. 

<h3> Set permissions to the .pem file </h3> 

Use `chmod 400 <your pem file>.pem` to give executable permissions.

<h3> Connect to EC2 instance </h3> 
Use `ssh -i <private-key-name>.pem ubuntu@<Public-IP-address>` to connect to your EC2 instance. 

<h3> Install Apache2 on EC2 Instance </h3> 

```bash
sudo apt update

sudo apt install apache2 -y

sudo systemctl status apache2
```

<h3> Add HTTP inbound rule to security groups </h3> 

Edit the inbound rule of the security group attached to the instance and add a new entry with the data. 
`HTTP`  `Custom` `0.0.0.0/0`

<h3> Test Apache2 Locally </h3> 

In the connected EC2, test if `curl localhost:80` is successfully running.

<h3> Access Apache2 from the browser </h3>     

Since we gave `0.0.0.0/0` as the entry for our `HTTP` in our security group, the web page can be accessed from an external browser. Open the browser and enter
`<External IP of EC2> : 80`. The web page should be accessible and Apache2 page must be displayed.

![Apache HomePage](https://ubuntucommunity.s3.dualstack.us-east-2.amazonaws.com/original/2X/7/771159b35c97e429247aac754ad44bf06cc1efa8.png "Apache Home Page")

<h3> Install MySql on EC2 </h3>

```bash
sudo apt install mysql-server -y

sudo mysql_secure_installation

sudo mysql
```
```sql
> show databases;

> exit
```

<h3> Install PHP on EC2 </h3> 

```bash
sudo apt install php libapache2-mod-php php-mysql -y
```
```php
php -v
```

<h3> Configure Virtual Host </h3>

Virtual hosts (vhosts) help you efficiently organize your sites. Here `lamp123` is my site name.
```bash
sudo mkdir /var/www/lamp123

sudo chown -R $USER:$USER /var/www/lamp123

sudo vi /etc/apache2/sites-available/lamp123.conf
```

<h6> Paste the following lines in the configuration file </h6>

To test Apache without the domain name, comment the `ServerName` and `ServerAlias`
``` vim

<VirtualHost *:80>
    ServerName lamp123
    ServerAlias www.lamp123 
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/lamp123
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

<h6> Back to Shell </h6>

```bash
sudo ls /etc/apache2/sites-available
```

<h3> Enable New Virtual Host </h3>

```bash
sudo a2ensite lamp123
```

<h6> Disable Apache's default website </h6>

If you are not using a custom domain name, Apache's default configuration would overwrite our virtual host.
```bash
sudo a2dissite 000-default
```

<h6> To make sure our configuration file does not have any syntax errors </h6>

```bash
sudo apache2ctl configtest
```

<h6> Reload Apache2 </h6>
```bash
sudo systemctl reload apache2
```

<h6> Create Homepage and test it </h6>

Now our site is active, but we do not have a home page. To create a home page use, 
```bash
sudo su
echo 'This is our LAMP site and it works..' > /var/www/index.html
```
` curl http://<EC2 Public IP>:80 `

<h3> Enable PHP on the website </h3>

<h6>Create Index.php</h6>

```bash
vi /var/www/lamp123/index.php
```
```php
<?php
phpinfo();
```

<h6> Change the configuration file </h6>

We still see the Apache2 web page on page refresh of our site. To change this, make changes to the configuration file. Replace `index.html` with `index.php`.

```bash
sudo vim /etc/apache2/mods-enabled/dir.conf
```

<h6> Reload Apache2 </h6>

```bash
sudo systemctl reload apache2
```


<h3>Reload the site</h3>

On reload, we can see that we have successfully setup PHP

![PHP HomePage](https://i1.wp.com/www.sumonselim.com/wp-content/uploads/2014/10/66253f7f058e5c326cafc83d6c90999d.png?w=968&ssl=1 "PHP Home Page")

<h3>Remove the PHP file</h3>
It is recommended to remove the PHP index file as it contains sensitive information.
```bash
sudo rm /var/www/projectlamp/index.php
```



