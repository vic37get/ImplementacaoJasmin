.class public produtoDoisNumeros
.super java/lang/Object

.method public static read()I

   .limit stack 5   ; up to five items can be pushed
   .limit locals 100

   ; the input function starts at this point
    ldc 0
    istore 50
  Label1:
    getstatic java/lang/System/in Ljava/io/InputStream;
    invokevirtual java/io/InputStream/read()I
    istore 51
    iload 51
    ldc 10 ; uso no mac (valor ASCII da tecla ENTER)
;    ldc 13 ; uso no windows (valor ASCII da tecla ENTER)
    isub
    ifeq Label2
    iload 51
    ldc 32 ; Ascii code - space
    isub
    ifeq Label2
    iload 51
    ldc 48
    isub
    ldc 10
    iload 50
    imul
    iadd
    istore 50
    goto Label1

  Label2:
    iload 50       ; input function ends here
    ireturn
.end method

;
; main() - read one number
;
.method public static main([Ljava/lang/String;)V
   .limit stack 5   ; up to five items can be pushed
   .limit locals 2

   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "Digite numero inteiro: x? "
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

; read x
   invokestatic leitura.read()I
   istore 0

   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "Digite numero inteiro: y? "
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

;read y
   invokestatic leitura.read()I
   istore 1

   getstatic java/lang/System/out Ljava/io/PrintStream;
   ldc "Produto de x e y: "
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 0
   iload 1
   imul
   invokevirtual java/io/PrintStream/println(I)V

   ; done
   return
.end method
