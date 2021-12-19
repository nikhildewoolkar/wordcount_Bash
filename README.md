# wordcount_Bash
wordcaount using Bash RedHat assignment

For this program first i downloaded link which was provided to me using wget. i used Regex to clean the data because it was having so many symbolic characters as well as i made each and every word lowercase so that it should not count words twice(ex. Nikhil, nikhil). Then i stored all data in file wordcount.txt. after that i read the file and applied threshold(100) to it and saved data in form of key-value pairr in associative array(Bash Dictionary) in sorted format. and using that figured out top frequency words and counted % for the same.Used 'bc' to calculate % because float value is not operatable in bash have to use 'bc'
