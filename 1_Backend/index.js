const crypto = require('crypto');
const express = require('express');
const app = express();
const port = 3000;

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

const submissions  = [];
app.post('/submission', (req, res)=> {
    const {name,email,phone } = req.body;
    if (!name || (!email && !phone)){
        return res.status(400).json({error: 'Name and Email/Phone Number is required'});
    }
    const id = crypto.randomUUID();
    submissions.push({id, name, email,phone });
    res.status(201).json({message: 'You have been registered', data: {id, name, email,phone}});
});


app.get('/submissions', (req, res) => {
  res.json(submissions);
});


app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});

app.use(express.static('public'));

