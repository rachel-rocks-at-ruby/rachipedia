## Rachipeda: a Wikipedia clone 

Users sign in using Devise. They can create Markdown-powered wikis with free accounts, or upgrade to a premium account by making a payment through Stripe. With a premium account, users can create private wikis, which require proper authorzation to view. Premium account holders may add add collaborators to their private wikis. 

https://rachipedia.herokuapp.com/

Refer to application.example.yml for set-up information.

#### Gems
* bootstrap-sass 3.1.1 - for styling

* devise - for user authentication

* figaro 1.0 - to securely store configuration values

* faker - to seed on development

* redcarpet - for Markdown

* stripe - to accept payments

* friendly_id - to create pretty URLs

* pundit - for authorization

* pry - to debug on development