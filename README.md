# Outdoor.sy Customer Importer

This is a command line tool that accepts a file with a list of customers and prints the sorted list.

Ruby Version: 2.6.8

## How to Run
* From this directory, open a ruby console (e.g. `irb`)
* Load the script: `load 'customer_importer.rb'`
* Run the script: `CustomerImporter.new(file_name: '<file name>').print_results`
  * Replace `<file name>` with a real file, such as the ones I have included here (`commas.txt`, `commas.csv`, and `pipes.txt`) or a path to your own. The script accepts
    * `txt` files with data delimited by commas or pipes
    * `csv` files with no headers
  * By default, the results will sort by the customer's full name. You may also pass a `sort` parameter, like so: `CustomerImporter.new(file_name: '<file name>').print_results(sort: :vehicle_name)`
    * Currently, only sorting on `full_name` and `vehicle_name` are supported, but other options could be easily added.

## Relevant Files to Review
* `customer.rb`
* `customer_importer.rb`

## Limitations
* I decided to write a command line script because I didn't think the requirements warranted something more complicated, and I knew I could build this version relatively quickly! By definition though, that means I'm not getting some of the benefits of a more full-fledged application, such as persisting data or a UI that users can engage with.
* The script only accepts `txt` and `csv` files.
* The script only accepts comma or pipe delimited data. If any rows contain invalid or missing data, I raise an error and stop the whole script. Another way to approach this would be to skip rows with invalid data and still print the rest of the results and/or to include more details on why the data is invalid. For the sake of time, I didn't implement that.
* To improve readability when the results are printed, I chose column widths for each attribute and truncated values that exceeded those widths.
