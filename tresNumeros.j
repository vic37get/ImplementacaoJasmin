.class public tresNumeros
.super java/lang/Object

.method public static main([Ljava/lang/String;)V
   .limit stack 10000
   .limit locals 10000

   new java/util/Scanner
   dup
   getstatic java/lang/System/in Ljava/io/InputStream;
   invokespecial java/util/Scanner/<init>(Ljava/io/InputStream;)V
   astore_1

   ; Leitura do valor MAT (Matrícula)
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "Digite o valor de MAT (matrícula): "
   invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V
   aload_1
   invokevirtual java/util/Scanner/nextInt()I
   istore 2

   ; Leitura do valor INI (Inicio)
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "Digite o valor de INI (início): "
   invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V
   aload_1
   invokevirtual java/util/Scanner/nextInt()I
   istore 3

   ; Leitura do valor FIM
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "Digite o valor de FIM: "
   invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V
   aload_1
   invokevirtual java/util/Scanner/nextInt()I
   istore 4

   ; 1.4 Se os valores de INI e FIM forem negativos, mostrar uma mensagem de erro.
   iload 3
   iflt L_verificaNegativoFim
   goto L_verificaIntervalo

   L_verificaNegativoFim:
      iload 4
      iflt L_saoNegativos
      goto L_verificaIntervalo

   L_saoNegativos:
      getstatic java/lang/System/out Ljava/io/PrintStream;
      ldc ""
      invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

      getstatic java/lang/System/out Ljava/io/PrintStream;
      ldc "Error: Os valores de INI e FIM são negativos!"
      invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
      goto L_end

   ; 1.1 Verificar se o intervalo fornecido é valido, ou seja, se FIM > INI
   L_verificaIntervalo:
      iload 4
      iload 3
      if_icmpgt L_imprimeIntervalo

      ; O valor de INI > FIM, pula o código de imprimir_intervalo
      getstatic java/lang/System/out Ljava/io/PrintStream;
      ldc "O valor de INI é maior que o valor de FIM!"
      invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

      goto L_dentroDoIntervalo

      L_imprimeIntervalo:
         getstatic java/lang/System/out Ljava/io/PrintStream;
         ldc "Intervalo: "
         invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

         ; Fazendo a soma do inicio do Loop com 1, para imprimir números no intervalo entre INI e FIM.
         iload 3 
         ldc 1
         iadd
         istore 5
         
         ; Armazenando a variavel para multiplos de 3.
         ldc2_w 1
         lstore 6

         ; 1.2.1 Imprimir a sequência dos números naturais entre INI e FIM.
         loop:
            ; Pular o ultimo numero do intervalo
            iload 5
            iload 4
            if_icmpge L_endLoop

            iload 5
            ifge L_natural
            goto L_verificaLoop
            L_natural:
               getstatic java/lang/System/out Ljava/io/PrintStream;
               iload 5 ; variavel i
               invokevirtual java/io/PrintStream/print(I)V
               getstatic java/lang/System/out Ljava/io/PrintStream;
               ldc " "
               invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V
            
            ; Verificando se é múltiplo de 3.
               iload 5 ; variavel i
               ldc 3
               irem ; resto da divisão de i por 3
               ifeq L_multiploTres
               goto L_verificaLoop

               L_multiploTres:
                  lload 6
                  iload 5
                  i2l
                  lmul
                  lstore 6

            ; Verificando o loop
            L_verificaLoop:
               iinc 5 1 ; incremento
               iload 5 ; variavel "i"
               iload 4 ; variavel FIM
               if_icmpge L_endLoop

            goto loop

         L_endLoop:
   
   ; 1.2.2 Imprimir o produto dos números do intervalo que são múltiplos de 3.
   ldc2_w 1
   lload 6
   lcmp
   ifeq L_multZero
   goto L_printProduto

   L_multZero:
      ldc2_w 0
      lstore 6

   L_printProduto:
      getstatic java/lang/System/out Ljava/io/PrintStream;
      ldc ""
      invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

      getstatic java/lang/System/out Ljava/io/PrintStream;
      ldc "Produto dos números do intervalo que são múltiplos de 3: "
      invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

      getstatic java/lang/System/out Ljava/io/PrintStream;
      lload 6
      invokevirtual java/io/PrintStream/println(J)V

   L_dentroDoIntervalo:
      ; 1.3 Verificar se INI <= MAT <= FIM, ou seja, se ele pertence ou não ao intervalo
      iload 3
      iload 2

      if_icmpgt L_foraIntervalo

      iload 2
      iload 4

      if_icmpgt L_foraIntervalo
      
      getstatic java/lang/System/out Ljava/io/PrintStream;
      ldc "O número de matricula "
      invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

      getstatic java/lang/System/out Ljava/io/PrintStream;
      iload 2
      invokevirtual java/io/PrintStream/print(I)V

      getstatic java/lang/System/out Ljava/io/PrintStream;
      ldc " faz parte do intervalo!"
      invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

      goto L_end

   L_foraIntervalo:
      getstatic java/lang/System/out Ljava/io/PrintStream;
      ldc "O número de matricula "
      invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

      getstatic java/lang/System/out Ljava/io/PrintStream;
      iload 2
      invokevirtual java/io/PrintStream/print(I)V

      getstatic java/lang/System/out Ljava/io/PrintStream;
      ldc " não faz parte do intervalo!"
      invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

   L_end:

   return

.end method