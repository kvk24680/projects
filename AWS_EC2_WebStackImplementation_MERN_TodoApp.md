<h3> Web Stack Implementation using MERN Stack - A Simple To Do App</h3>

**M**ongoDB **E**xpressJS **R**eactJS **N**ode.js

![MERN stack Architecture](https://webimages.mongodb.com/_com_assets/cms/mern-stack-b9q1kbudz0.png?auto=format%2Ccompress "MERN stack Architecture")

<h5>Connect to EC2 and run the commands</h5>

<h6>Update Packages and OS</h6>

```bash 
sudo apt update

sudo apt upgrade
```

<h6>Install NodeJS</h6>

```bash
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -

sudo apt-get install -y nodejs

node -v

npm -v
```

<h6>Initialise the project and install ExpressJS</h6>

```bash
mkdir Todo  &&  cd Todo

npm init

npm install express &&  npm install dotenv

# Creating index file
touch index.js```
```

<h6>Start the server</h6>
```bash
node index.js
```
<h6>Add port to security group</h6>

Since the application runs on port **5000**, we need to add that into our security group list, by entering the following values
`Custom TCP` `TCP` `5000` `Custom` `0.0.0.0/0`

<h5>Test the connection in browser</h5>

```bash
http://<PublicIP-or-PublicDNS>:5000
```
---
<h5>Routes</h5>

There are 3 actions that we must accomplish in our To Do Application.
1. Create a new task
2. Display list of all tasks
3. Delete a completed task
   
Each task will be associated with some particular endpoint and will use different standard HTTP request methods: **POST**, **GET**, **DELETE**. For each task, we need to create routes that will define various endpoints that the To-do app will depend on.

```bash
mkdir routes && cd routes

vi api.js
```
```javascript
const express = require ('express');
const router = express.Router();

router.get('/todos', (req, res, next) => {

});

router.post('/todos', (req, res, next) => {

});

router.delete('/todos/:id', (req, res, next) => {

})

module.exports = router;
```
---
<h5>Models</h5>

A model is at the heart of JavaScript based applications, and it is what makes it interactive. We will also use models to define the database schema. This is important so that we will be able to define the fields stored in each Mongodb document.

```bash
# Install Mangoose
npm install mongoose

# Create Models
mkdir models && cd models

vi todo.js
```
```javascript
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

//create schema for todo
const TodoSchema = new Schema({
action: {
type: String,
required: [true, 'The todo text field is required']
}
})

//create model for todo
const Todo = mongoose.model('todo', TodoSchema);

module.exports = Todo;
```
<h6>Update our routes from the file api.js in ‘routes’ directory to make use of the new model.</h6>

The updated code looks like

```javascript
const express = require ('express');
const router = express.Router();
const Todo = require('../models/todo');

router.get('/todos', (req, res, next) => {

//this will return all the data, exposing only the id and action field to the client
Todo.find({}, 'action')
.then(data => res.json(data))
.catch(next)
});

router.post('/todos', (req, res, next) => {
if(req.body.action){
Todo.create(req.body)
.then(data => res.json(data))
.catch(next)
}else {
res.json({
error: "The input field is empty"
})
}
});

router.delete('/todos/:id', (req, res, next) => {
Todo.findOneAndDelete({"_id": req.params.id})
.then(data => res.json(data))
.catch(next)
})

module.exports = router;
```
---

