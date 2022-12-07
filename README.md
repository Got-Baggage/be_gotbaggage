<a name="readme-top"></a>

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
<p align="right">(<a href="#readme-top">back to top</a>)</p>

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
<p align="right">(<a href="#readme-top">back to top</a>)</p>

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
  <li>rake load:all_items</li> 
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<h2 id="schema"> Schema</h2>

<img width="487" alt="Database Schema" src="https://user-images.githubusercontent.com/98506079/206060083-ad1d9144-d470-406d-a1d2-f94920eaf4cc.png">
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<h2 id="endpoints"> Endpoints</h2>

<h2 id="query"> Query/Mutation Example Responses</h2>
  
Essential items and Items by Category("beach"):
```javascript
query
  {
  essentialItems{
    name
  }
  itemsByCategory(category: 1)
  {
      name
    }
  }
```
```javascript
sample response
  {
  "data": {
    "essentialItems": [
      {
        "name": "Shampoo"
      },
      {
        "name": "Conditioner "
      }
    ],
    "itemsByCategory": [
      {
        "name": "Beach umbrella"
      },
      {
        "name": "Sunscreen "
      }
    ]
  }
}
```

Create Trip:
```javascript
mutation	{
  tripCreate(input: {name: “Baggage Trip”, category: 3})
  {
    trip {
      name
      category
      image
    }
  }
}
```
```javascript
response
  {
    "data": {
      "tripCreate": {
        "trip": {
          "name": "Baggage Trip",
          "category": "international",
          "traveler": "Stephen",
          "image": "https://www.lonestar.edu/images/internationalTravel.jpg"
        }
      }
    }
  }
```

Create Item:
```javascript
mutation{
  itemCreate(input: {tripId: 1, itemName: “boss item”})
  {
    item{
      name
    }
  }
}
```
```javascript
response
  {
    "data": {
      "tripCreate": {
        "trip": {
          "name": "Baggage Trip",
          "category": "international",
          "traveler": "Stephen",
          "image": "https://www.lonestar.edu/images/internationalTravel.jpg"
        }
      }
    }
  }
```

Category Names:
```javascript
query {
    categoryNames
    }
```
```javascript
response
{
  “data”: {
    “categoryNames”: [
      “essentials”,
      “beach”,
      “camping”,
      “international”,
      “city”,
      “snowsports”,
      “roadtrip”
    ]
  }
}
```

Deleting an item from a trip list:
```javascript
mutation{
  tripItemDelete(input: {tripId: 1,itemID: 33})
  {
    tripItem{
      id
    }
  }
}
```
```javascript
response
  {
    "tripItemDelete": {
      "tripItemDelete": {
        "tripItem": {
          "id": "3"
        }
      }
    }
  }
```

Deleting a trip:
```javascript
mutation {tripDelete(input: {id:1})
  {
  trip{
    id
  	}
	}
}
```
```javascript
response
  {
    "data": {
      "tripDelete": {
        "trip": {
          "id": "1"
        }
      }
    }
  }
```
<p align="right">(<a href="#readme-top">back to top</a>)</p>


<h2 id="contributors"> Contributors</h2>
<h3>Nicole Esquer</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/nicole-esquer)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/nicole-esquer)

<h3>Nikky Rojas</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/nikkyrojas/)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/nikkyrojas/)

<h3>Stephen Fabian</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/stephenfabian)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/stephen-fabian-5498658a/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>