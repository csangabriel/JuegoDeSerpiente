      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  WS-PAUSA               PIC X.
       01  WS-Y                   PIC 99 VALUE 03.
       01  WS-X                   PIC 99 VALUE 15.
       01  WS-CONTADOR            PIC 99 VALUE ZERO.
       01  WS-MOVIMIENTO          PIC A  VALUE ' '.
       01  WS-INDICE              PIC 99 VALUE ZEROS.
       01  WS-LARGO               PIC 99.
       01  WS-SALTOS              PIC 99.

       01  WS-SERPIENTE OCCURS 100 TIMES INDEXED BY WS-INDICE.
           05 WS-CUADRO           PIC 99.
           05 WS-POS-X            PIC 99.
           05 WS-POS-Y            PIC 99.
           05 WS-CUERPO           PIC XX VALUE "  ".

       SCREEN SECTION.

       01  SS-O BACKGROUND-COLOR IS 02 HIGHLIGHT.
           05 LINE WS-Y COL WS-X VALUE "  ".


       01  SS-LIMPIAR-PANTALLA.
           05 BLANK SCREEN.


       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

       000-INICIO.

           PERFORM UNTIL WS-CONTADOR = 50
               ADD 3 TO WS-CONTADOR
               DISPLAY SS-O LINE WS-Y COL WS-CONTADOR
               MOVE WS-Y TO WS-POS-Y(1)
               MOVE WS-CONTADOR TO WS-POS-X(1)
               ACCEPT WS-MOVIMIENTO LINE 1 COL 1 TIME 1
               DISPLAY SS-LIMPIAR-PANTALLA

               PERFORM 400-CUERPO-SERPIENTE THRU 400-FIN

               IF WS-MOVIMIENTO = 'K' OR 'k'
                   PERFORM 100-ABAJO THRU 100-FIN
               ELSE IF WS-MOVIMIENTO = "I" OR "i"
                   PERFORM 300-ARRIBA THRU 300-FIN
           END-PERFORM.

       000-FIN. EXIT

       GOBACK.

       100-ABAJO.

           PERFORM UNTIL WS-CONTADOR = 50
           ADD 1 TO WS-Y
           DISPLAY SS-O LINE WS-Y COL WS-CONTADOR
           MOVE WS-Y TO WS-POS-Y(1)
               MOVE WS-CONTADOR TO WS-POS-X(1)
           ACCEPT WS-MOVIMIENTO LINE 1 COL 1 TIME 1
           DISPLAY SS-LIMPIAR-PANTALLA
           PERFORM 400-CUERPO-SERPIENTE THRU 400-FIN

           IF WS-MOVIMIENTO = "L" OR  "l"
               PERFORM 000-INICIO THRU 000-FIN
           ELSE IF WS-MOVIMIENTO = "J" OR "j"
               PERFORM 200-IZQUIERDA THRU 200-FIN
           END-PERFORM.

       100-FIN. EXIT.

       200-IZQUIERDA.

           PERFORM UNTIL WS-CONTADOR = 50
           SUBTRACT 3 FROM WS-CONTADOR
           DISPLAY SS-O LINE WS-Y COL WS-CONTADOR
           ACCEPT WS-MOVIMIENTO LINE 1 COL 1 TIME 1
           DISPLAY SS-LIMPIAR-PANTALLA
           IF WS-MOVIMIENTO = "I" OR "i"
               PERFORM 300-ARRIBA THRU 300-FIN
           ELSE IF WS-MOVIMIENTO = "k" OR "K"
               PERFORM 100-ABAJO THRU 100-FIN
           END-PERFORM.

       200-FIN. EXIT.


       300-ARRIBA.
           PERFORM UNTIL WS-CONTADOR = 50
           SUBTRACT 1 FROM WS-Y
           DISPLAY SS-O LINE WS-Y COL WS-CONTADOR
           ACCEPT WS-MOVIMIENTO LINE 1 COL 1 TIME 1
           ACCEPT SS-LIMPIAR-PANTALLA
           IF WS-MOVIMIENTO = "L" OR "l"
               PERFORM 000-INICIO THRU 000-FIN
           ELSE IF WS-MOVIMIENTO = "J" OR "j"
               PERFORM 200-IZQUIERDA THRU 200-FIN
           END-PERFORM.

       300-FIN. EXIT.


       400-CUERPO-SERPIENTE.

           DISPLAY SS-O LINE WS-POS-Y(1)  COL WS-POS-X(1).
           MOVE WS-POS-Y(1) TO WS-POS-Y(2).
           MOVE WS-POS-X(1) TO WS-POS-X(2).

      *     DISPLAY SS-O LINE WS-POS-X(2) COL WS-POS-Y(2).


       400-FIN. EXIT.
