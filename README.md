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
  <li>Run the Figaro command: <em>bundle exec figaro install</em></li><br>

Sign up for the following API keys and update the `application.yml` file with `ENV` variables to store the API keys: <br>

<h2 id="schema"> Schema</h2>

<img width="487" alt="Screenshot 2022-11-16 at 4 27 21 AM" src="https://user-images.githubusercontent.com/98506079/205390500-766a72f2-1e6e-4bc8-9a10-dcb28c9b1be8.png">

<h2 id="endpoints"> Endpoints</h2>

<h2 id="contributors"> Contributors</h2>