# iTunes Podcast Database

This project includes all the necessary framework for an iTunes Podcast Database with a command line interface.
Queries to this database can take multiple optional parameters in the form "attribute: query word or phrase".
These are the parameters:

title: string
genre: string
minimum_rating: float (out of five)
avg_episode_length: integer (minutes)
mediacompany: string
keyword: string

Here is an example query:
mediacompany: npr, keyword: supreme court, minimum_rating: 4.5

This search would return all Podcasts or Episodes that match the keyword of supreme court, have a minimum rating of 4.5 stars, and were published by NPR.

## Getting Started

As it currently stands, the database is seeded using a method called "add_records_to_database", which can be found in "/lib/run_files/add_records_to_database.rb". This method is currently set to import information on 50 podcasts. If you would like your database to hold more or less records, edit the url in the "add_records_to_database" method where it says "limit=50" to be the number of records that you would prefer. NOTE: "limit" can be set equal to any integer between 1 and 200.

When you are ready to seed the database, run "rake console", then run "add_records_to_database".

This should take a few minutes, depending on the search limit you have indicated. Once this process is complete, exit the console and run "ruby bin/run.rb" to enter the database. Follow the onscreen instructions to find the information you need!

## Contributing

   This sql database is stored and operated on using ActiveRecord. All migration files currently exist in "/db/migrate", with corresponding class files stored in "/lib/models".
   
   If you are interested in editing the process with which the database is seeded, you will find all necessary methods and information in "/lib/run_files/add_records_to_database.rb"
   
   If you are interested in enhancing the types of queries made to the database, you will find all necessary methods and information in "/lib/run_files/cli_queries.rb"
   
   If you are interested in enhancing the database's command line interface, you will find all necessary methods and information in "/lib/run_files/command_line_interface.rb"

## Authors

    Matt McAlister
    Siobhan Mahoney

## License

This project is licensed under the MIT License - see the LICENSE.md file for details

## Acknowledgments

    The Flatiron School (Especially Lindsey, Natalie, and Johann. Mad props.)
    Apple and iTunes (Praised be.)
    All Podcasters everywhere.
