#query example, using items_by_category method (located in query_type.rb)

# query {
#   itemsByCategory(category: 1 )
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


#Query
#  query {
#   essentialItems 
#   {
#     name
#   },
# 	itemsByCategory(category: 1)
#   {
#     name
#   }
# }

#Delete trip item Mutation
#  mutation {tripItemDelete(input: {tripId:1,itemId:1}){
#   tripItem {
#     id
#   }
# }
# }

#Delet trip mutation
# mutation {tripDelete(input: {id:1})
#   {
#   trip{
#     id
#   	}
# 	}
# }
