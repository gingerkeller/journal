# createjournal.sh
Command-line tools for creating a yearly journal with one file per entry in month folders.
## Installation
1. Download the script. Journal entries will be created in the same directory.
2. Make it executable
```bash
chmod u+x createjournal.sh
```
## Usage
```bash
./createjournal.sh [YEAR]
```
Entries are created within the same directory as the script. If you omit the year, entries are created for next year. 
### Example: create a journal for 2026
```bash
./createjournal.sh 2026
```
### Example: create a journal for 2027 (if executed before 1/1/2027)
```bash
./createjournal.sh
```
## Structure
```
2027/
|-2027-01
| |-2027-01-01.txt
| |-2027-01-02.txt
| |-...
|-2027-02
| |-2027-02-01.txt
| |-...
```
Each text file contains a heading with the day number, month name, year, and day of the week:
```text
01 January 2027 Friday
```
## License
MIT
## Notes
* Developed on MacOS
