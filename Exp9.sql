Key Value Pair Based - Data is stored in key/value pairs. It is designed in such a way to handle lots of data and 
heavy load. - Key-value pair storage databases store data as a hash table where each key is unique, and 
the value can be a JSON, BLOB (Binary Large Objects), string, etc. - For example, a key-value pair may contain a key like "Website" associated with a value like 
"Guru99". 
                        - It is one of the most basic NoSQL database example. This kind of NoSQL database is used 
as a collection, dictionaries, associative arrays, etc. Key value stores help the developer to 
store schema-less data. They work best for shopping cart contents. - Redis, Dynamo, Riak are some NoSQL examples of key-value store DataBases. They are 
all based on Amazon's Dynamo paper. 
Column-based - Column-oriented databases work on columns and are based on BigTable paper by Google. 
Every column is treated separately. Values of single column databases are stored 
contiguously. 
                           
- They deliver high performance on aggregation queries like SUM, COUNT, AVG, MIN etc. 
as the data is readily available in a column. - Column-based NoSQL databases are widely used to manage data warehouses, business 
intelligence, CRM, Library card catalogs. - HBase, Cassandra, HBase, Hypertable are NoSQL query examples of column based 
database. 
 
Document-Oriented - Document-Oriented NoSQL DB stores and retrieves data as a key value pair but the value 
part is stored as a document. The document is stored in JSON or XML formats. The value is 
understood by the DB and can be queried. 
 
Graph-Based - A graph type database stores entities as well the relations amongst those entities. The entity 
is stored as a node with the relationship as edges. An edge gives a relationship between 
nodes. Every node and edge has a unique identifier. 
                       
