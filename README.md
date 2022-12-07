# Got Baggage?

<h2> Table of Contents</h2>
<details open="open">
<summary>Table of Contents</summary>
  <ol>
    <li><a href="#technical-requirements"> Technical Requirements</a></li>
    <li><a href="#gems-and-tools"> Gems and Tools</a></li>
    <li><a href="#installation"> Installation</a></li>
    <li><a href="#schema"> Schema</a></li>
    <li><a href="#endpoints"> API Endpoints</a></li>
    <li><a href="#query"> GraphQL Query/Mutations</a></li>
    <li><a href="#contributors"> Contributors</a></li>
  </ol>
</details>

<h2 id="technical-requirements">Technical Requirements</h2>
<ul>
<li>Ruby 2.7.4</li>
<li>Rails 5.2.8</li>
</ul>

<h2 id="gems-and-tools">Gems and Tools</h2>
<ul>
  <li><a href="https://github.com/thoughtbot/factory_bot_rails">Factory Bot</a></li>
  <li><a href="https://github.com/faker-ruby/faker">Faker</a></li>
  <li><a href="https://github.com/lostisland/faraday">Faraday</a></li>
  <li><a href="https://github.com/laserlemon/figaro">Figaro</a></li>
  <li><a href="https://github.com/jsonapi-serializer/jsonapi-serializer#installation">JsonApi Serializer</a></li>
  <li><a href="https://www.postman.com/">Postman</a></li>
  <li><a href="https://github.com/pry/pry">Pry</a></li>
  <li><a href="https://github.com/simplecov-ruby/simplecov">SimpleCov</a></li>
  <li><a href="https://relishapp.com/vcr/vcr/docs">VCR</a></li>
  <li><a href="https://github.com/bblimke/webmock">Webmock</a></li>
  <li><a href="https://github.com/rspec/rspec-rails">RSpec</a></li>
</ul>

<h2 id="installation"> Installation </h2>

To get started, clone the repo in your terminal by entering the following:

<ul>
  <li>git clone git@github.com:Got-Baggage/be_gotbaggage.git</li>
</ul>  
   
Once cloned, run the following commands:
<ul>
  <li>bundle install</li>
  <li>rails db:create</li>
  <li>rails db:migrate</li> 
  <li>rake load:essential_items</li> 
  <li>rake load:beach_items</li> 
  <li>Run the Figaro command: <em>bundle exec figaro install</em></li><br>

Sign up for the following API keys and update the `application.yml` file with `ENV` variables to store the API keys: <br>

<h2 id="schema"> Schema</h2>

<img width="487" alt="Screenshot 2022-11-16 at 4 27 21 AM" src="https://user-images.githubusercontent.com/98506079/205390500-766a72f2-1e6e-4bc8-9a10-dcb28c9b1be8.png">

<h2 id="endpoints"> Endpoints</h2>

<h2 id="query"> Query/Mutation Example Responses</h2>
Query list of items by category and essentials:
  
![query essentail item:category item](https://user-images.githubusercontent.com/103013480/205972654-009f90fe-a6fd-4e47-9e59-dcc14d7a0ca4.png)
![reponse essential items and category](https://user-images.githubusercontent.com/103013480/205972693-a65f5b48-52d8-48e7-810e-589ed1801063.png)

  
Deleting an item from a trip list:
  
![mutation delete trip](https://user-images.githubusercontent.com/103013480/205972023-07248416-2bd2-40dc-a907-4685d63ab2b7.png)
![response delete trip ](https://user-images.githubusercontent.com/103013480/205972036-c6f10083-ef4f-486b-a4e8-eacc757637eb.png)

Deleting a Trip

![mutation delete trip](https://user-images.githubusercontent.com/103013480/205998126-49323926-1454-4ebc-a2b3-ee66a2f00862.png)
![response delete trip](https://user-images.githubusercontent.com/103013480/205998196-9c537c6b-f3d5-4991-b4f9-b342cf5e4be6.png)

Category Names

query:

```bash
query {
    categoryNames
    }
```

<h2 id="contributors"> Contributors</h2>
