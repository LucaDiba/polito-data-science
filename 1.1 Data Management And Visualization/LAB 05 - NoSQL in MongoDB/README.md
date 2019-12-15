### Setup
```
> db.getCollectionNames()
[ ]
> db.createCollection("restaurants")
{ "ok" : 1 }
> db.getCollectionNames()
[ "restaurants" ]

> db.restaurants.insertMany([
... {_id:"001",name:"ToorSeafoodrestaurant",tag:["seafood","expensive"],orderNeeded:false,maxPeople:100,review:4.3,cost:"medium",location:{type:"Point",coordinates:[45.0664,7.6609]},contact:{phone:"+390223456245",facebook:"ToorSeaFood"}},
... {_id:"002",name:"PandaParadise",tag:["chinese","japanese"],orderNeeded:false,maxPeople:50,review:4.7,cost:"low",location:{type:"Point",coordinates:[45.0671,7.6627]},contact:{phone:"+395487634998",facebook:"PandaP"}},
... {_id:"003",name:"Stagione",tag:["italian","pizza"],orderNeeded:false,maxPeople:10,review:3.8,cost:"low",location:{type:"Point",coordinates:[45.0698,7.6634]},contact:{phone:"+390223456245",}},
... {_id:"004",name:"Takitai",tag:["tai","spicy"],orderNeeded:true,maxPeople:150,review:4.2,cost:"high",location:{type:"Point",coordinates:[45.0609,7.6568]},contact:{phone:"+39087673456",facebook:"TakiTai",twitter:"TakiTaiOfficial"}},
... {_id:"005",name:"MishiSushi",tag:["japanese","unlimitedoffering"],orderNeeded:false,maxPeople:75,review:3.9,cost:"low",location:{type:"Point",coordinates:[45.0587,7.6612]},contact:{}},
... {_id:"006",name:"IlDivinPanino",tag:["casual","goodforkids"],orderNeeded:false,maxPeople:10,review:4.6,cost:"low",location:{type:"Point",coordinates:[45.0645,7.6608]},contact:{phone:"+393319416860",website:"ildivinpanino.it"}},
... {_id:"007",name:"IlTempo",tag:["italian","cosy"],orderNeeded:true,maxPeople:100,review:4.2,cost:"high",location:{type:"Point",coordinates:[45.0661,7.6544]},contact:{phone:"+398772376563",}},
... {_id:"008",name:"Smartbar",tag:["bar","morningcoffee"],orderNeeded:false,maxPeople:15,review:4.5,cost:"low",location:{type:"Point",coordinates:[45.0643,7.6494]},contact:{phone:"+390986756234",}},
... {_id:"009",name:"Mcdownloads",tag:["fastfood"],orderNeeded:false,maxPeople:70,review:3.9,cost:"medium",location:{type:"Point",coordinates:[45.0696,7.6503]},contact:{Facebook:"McdownloadTorino",website:"mcdownloads.com"}},
... {_id:"010",name:"OldNavyHamburgar",tag:["hamburgur"],orderNeeded:false,maxPeople:100,review:4.5,cost:"medium",location:{type:"Point",coordinates:[45.0772,7.6740]},contact:{phone:"+396763452345",facebook:"OldNavyHamburgar"}}
... ])
{
        "acknowledged" : true,
        "insertedIds" : [
                "001",
                "002",
                "003",
                "004",
                "005",
                "006",
                "007",
                "008",
                "009",
                "010"
        ]
}


> db.restaurants.find().pretty()
```

### Queries
#### 1
```
db.restaurants.find(
	{cost: "medium"}
)
```

#### 2
```
db.restaurants.find({
		review: {$gt: 4},
		$or:
		[
			{cost: "medium"},
			{cost: "low"}
		]
})
```

#### 3
```
db.restaurants.find({
	maxPeople: {$gt: 5},
	$or:
	[
		# whose tag contains "italian" or "japanese" and cost is â€‹mediumâ€‹ or â€‹high		
		{
			tags: {$in: ['italian', 'japanese']},
			$or:
			[
				{cost: 'medium'},
				{cost: 'high'}
			]
		},
		# whose tag does not contain neither "italian" nor "japanese", and whose review is higher than 4.5
		{
			tags: {$nin: ['italian', 'japanese']},
			review: {$gt: 4.5}
		}
	]
})
```

#### 4
```
db.restaurants.aggregate([
	{ $group:
		{
			_id: null,
			avgReview: {$avg: "$review"}
		}
	}
])
```

#### 5
```
db.restaurants.aggregate([
	{ $match:
		{
			review: {$gt: 4.5},
			maxPeople: {$gt: 5}
		}
	},
	{ $group:
		{
			_id: null,
			restaurantsNumber: {
				$sum: 1
			}
		}
	}
])
```

#### 6
```
db.restaurants.mapReduce(
	function(){
		emit(null, this.review);
	},
	function(key, values){
		sum = 0;
		for(i=0; i<values.length; ++i){
			sum += values[i];
		}
		avg = sum / values.length;
		return avg;
	},
	{
		out: "avgReview"
	}
)
```

#### 7
```
db.restaurants.mapReduce(
	function(){
		emit(null, this.review);
	},
	function(key, values){
		return values.length;
	},
	{
		query:
		{
			review: {$gt: 4.5},
			maxPeople: {$gt: 5}
		},
		out: "restaurantsNumber"
	}
)
```

#### 8
```
db.restaurants.createIndex({location: "2dsphere"})

db.restaurants.find({
	location: {
		$near: {
			$geometry: {
				type: "Point",
				coordinates: [45.0644, 7.6598]
			}
		}
	}
}).limit(1)
```

#### 9
```
db.restaurants.createIndex({location: "2dsphere"})

db.restaurants.aggregate([
	{ match:
		{
			location: {
				$near: {
					$geometry: {
						type: "Point",
						coordinates: [45.0623, 7.6627]
					},
					$maxDistance: 500 
				}
			}
		}
	},
	{ $group:
		{
			_id: null,
			restaurantsNumberIn500Meters: {
				$sum: 1
			}
		}
	}
])
```