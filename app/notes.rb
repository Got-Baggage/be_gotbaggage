#query example, using items_by_category method (located in query_type.rb)

# query {
#   itemsByCategory(category: "essentials" )
#   {
#     name
#     category
#   }
# }




#response:

# {
#   "data": {
#     "itemsByCategory": [
#       {
#         "name": "Toothbrush",
#         "category": "essentials"
#       },
#       {
#         "name": "Socks",
#         "category": "essentials"
#       },
#       {
#         "name": "Shirt",
#         "category": "essentials"
#       },
#       {
#         "name": "Hat",
#         "category": "essentials"
#       }
#     ]
#   }
# }