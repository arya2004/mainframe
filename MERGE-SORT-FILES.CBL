       IDENTIFICATION DIVISION.
       PROGRAM-ID. MERGE3FILES.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
           SELECT INPUT-FILE-1 ASSIGN TO 'FILE1.DAT'
               ORGANIZATION IS LINE SEQUENTIAL.

           SELECT INPUT-FILE-2 ASSIGN TO 'FILE2.DAT'
               ORGANIZATION IS LINE SEQUENTIAL.

           SELECT INPUT-FILE-3 ASSIGN TO 'FILE3.DAT'
               ORGANIZATION IS LINE SEQUENTIAL.

           SELECT OUTPUT-FILE ASSIGN TO 'OUTPUT.DAT'
               ORGANIZATION IS LINE SEQUENTIAL.

           SELECT SORT-FILE ASSIGN TO 'SORTFILE.TMP'.

       DATA DIVISION.
       FILE SECTION.

       FD INPUT-FILE-1.
       01 INPUT-RECORD-1.
           05 INPUT-KEY1    PIC X(10).
           05 INPUT-DATA1   PIC X(70).

       FD INPUT-FILE-2.
       01 INPUT-RECORD-2.
           05 INPUT-KEY2    PIC X(10).
           05 INPUT-DATA2   PIC X(70).

       FD INPUT-FILE-3.
       01 INPUT-RECORD-3.
           05 INPUT-KEY3    PIC X(10).
           05 INPUT-DATA3   PIC X(70).

       FD OUTPUT-FILE.
       01 OUTPUT-RECORD.
           05 OUTPUT-KEY   PIC X(10).
           05 OUTPUT-DATA  PIC X(70).

       SD SORT-FILE.
       01 SORT-RECORD.
           05 SORT-KEY     PIC X(10).
           05 SORT-DATA    PIC X(70).

       WORKING-STORAGE SECTION.
       01 EOF-FLAG1  PIC X VALUE 'N'.
       01 EOF-FLAG2  PIC X VALUE 'N'.
       01 EOF-FLAG3  PIC X VALUE 'N'.

       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           OPEN INPUT INPUT-FILE-1 INPUT-FILE-2 INPUT-FILE-3.

           SORT SORT-FILE
               ON ASCENDING KEY SORT-KEY
               INPUT PROCEDURE IS GET-INPUT
               OUTPUT PROCEDURE IS WRITE-OUTPUT.

           CLOSE INPUT-FILE-1 INPUT-FILE-2 INPUT-FILE-3 OUTPUT-FILE.

           STOP RUN.

       GET-INPUT SECTION.
           PERFORM UNTIL EOF-FLAG1 = 'Y' AND EOF-FLAG2 = 'Y' AND EOF-FLAG3 = 'Y'

               IF EOF-FLAG1 NOT = 'Y'
                   READ INPUT-FILE-1 INTO INPUT-RECORD-1
                       AT END MOVE 'Y' TO EOF-FLAG1
                       NOT AT END
                           MOVE INPUT-KEY1 TO SORT-KEY
                           MOVE INPUT-DATA1 TO SORT-DATA
                           RELEASE SORT-RECORD
                   END-READ
               END-IF

               IF EOF-FLAG2 NOT = 'Y'
                   READ INPUT-FILE-2 INTO INPUT-RECORD-2
                       AT END MOVE 'Y' TO EOF-FLAG2
                       NOT AT END
                           MOVE INPUT-KEY2 TO SORT-KEY
                           MOVE INPUT-DATA2 TO SORT-DATA
                           RELEASE SORT-RECORD
                   END-READ
               END-IF

               IF EOF-FLAG3 NOT = 'Y'
                   READ INPUT-FILE-3 INTO INPUT-RECORD-3
                       AT END MOVE 'Y' TO EOF-FLAG3
                       NOT AT END
                           MOVE INPUT-KEY3 TO SORT-KEY
                           MOVE INPUT-DATA3 TO SORT-DATA
                           RELEASE SORT-RECORD
                   END-READ
               END-IF

           END-PERFORM.

       WRITE-OUTPUT SECTION.
           OPEN OUTPUT OUTPUT-FILE.

           PERFORM UNTIL 0 = 1
               RETURN SORT-FILE INTO SORT-RECORD
                   AT END EXIT PERFORM
                   NOT AT END
                       MOVE SORT-KEY TO OUTPUT-KEY
                       MOVE SORT-DATA TO OUTPUT-DATA
                       WRITE OUTPUT-RECORD
               END-RETURN
           END-PERFORM.
