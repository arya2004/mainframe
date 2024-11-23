# MERGE-SORT-FILES.cbl

A COBOL application program that merges the content of three input files, sorts them by a key, and writes the sorted data into an output file. This program demonstrates the use of COBOL's sorting capabilities and file handling.

## Program Overview

The `MERGE3FILES` program reads data from three line-sequential input files (`FILE1.DAT`, `FILE2.DAT`, and `FILE3.DAT`), merges their content, sorts them by a specified key, and writes the sorted records into a single output file (`OUTPUT.DAT`). The sorting is performed using a temporary sort file (`SORTFILE.TMP`).

## Features

- Reads from multiple input files.
- Merges and sorts data by a key field (`SORT-KEY`).
- Writes the sorted data into an output file.
- Demonstrates the use of COBOL's `SORT` verb and file handling.

## File Structure

### Input Files
Each input file (`FILE1.DAT`, `FILE2.DAT`, `FILE3.DAT`) contains records with the following structure:
- `KEY` (10 characters)
- `DATA` (70 characters)

### Output File
The output file (`OUTPUT.DAT`) contains records with the following structure:
- `KEY` (10 characters)
- `DATA` (70 characters)

### Temporary Sort File
The temporary sort file (`SORTFILE.TMP`) is used during the sort operation. It has the same structure as the input and output files.

## How It Works

1. **Input Phase**: The program reads records from the three input files. For each record:
   - The `KEY` and `DATA` fields are moved to the sort file (`SORTFILE.TMP`).

2. **Sort Phase**: Using the COBOL `SORT` verb, the program sorts the records in ascending order of the `KEY` field.

3. **Output Phase**: The sorted records are retrieved from the sort file and written to the output file (`OUTPUT.DAT`).

## Usage

1. Prepare three input files (`FILE1.DAT`, `FILE2.DAT`, `FILE3.DAT`) with the desired records in the specified format.
2. Compile the COBOL program using a COBOL compiler (e.g., `cobc` for GnuCOBOL):
   ```bash
   cobc -x -free MERGE-SORT-FILES.CBL -o MERGE-SORT-FILES.exe
   ```
3. Execute the program:
   ```bash
   ./MERGE-SORT-FILES.exe
   ```
4. Check the output in `OUTPUT.DAT`.

## Example Input and Output

### Input Files

**FILE1.DAT**
```
001     Data from File 1 Record 1
003     Data from File 1 Record 2
```

**FILE2.DAT**
```
002     Data from File 2 Record 1
004     Data from File 2 Record 2
```

**FILE3.DAT**
```
005     Data from File 3 Record 1
```

### Output File

**OUTPUT.DAT**
```
001     Data from File 1 Record 1
002     Data from File 2 Record 1
003     Data from File 1 Record 2
004     Data from File 2 Record 2
005     Data from File 3 Record 1
```

