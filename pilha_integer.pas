unit pilha;
interface
  const pilhaMaxSize = 5000;

  type
    tPilha = record
      arr: array[1..pilhaMaxSize] of integer;
      qtd: integer;
      max: integer;
    end;


  procedure mostrarPilha(pilha: tPilha);
  function removerDaPilha(var pilha: tPilha): integer;
  function recuperarValorPilha(var pilha: tPilha): integer;
  function recuperarValorPilhaPosicao(posicao: integer; var pilha: tPilha): integer;
  function inserirNaPilha(valor: integer;var pilha: tPilha):integer;
  procedure inicializarPilha(var pilha: tPilha; tamanho: integer);


implementation
  //Procedimentos
  procedure mostrarPilha(pilha: tPilha);
    var i: integer;
    begin
      with pilha do begin
        writeln();
        writeln('Imprimindo pilha...');
        writeln('Quantidade: ', qtd);
        for i:= 1 to qtd do
          writeln('[', i, ']', ' - ', arr[i]);
      end;
    end;

  function removerDaPilha(var pilha: tPilha): integer;
    var posicao:integer;
    begin
      with pilha do begin
        if (qtd = 0) then begin
          writeln('A pilha esta vazia');
          removerDaPilha:= 0
        end else begin
          removerDaPilha:= arr[qtd];
          dec(qtd);
        end;
      end;
    end;
  function recuperarValorPilha(var pilha: tPilha): integer;
    begin
      with pilha do begin
        if (qtd > 0) then begin
          recuperarValorPilha:= arr[qtd];
        end else begin
          recuperarValorPilha:= 0;
          writeln('A pilha esta vazia')
        end;
      end;
    end;
  function recuperarValorPilhaPosicao(posicao: integer; var pilha: tPilha): integer;
    begin
      with pilha do begin
        if ((posicao > 0) and (posicao <= qtd)) then begin
          recuperarValorPilhaPosicao:= arr[posicao];
        end else begin
          recuperarValorPilhaPosicao:= 0;
          writeln('Esta posicao nao existe na pilha')
        end;
      end;
    end;

  function inserirNaPilha(valor: integer;var pilha: tPilha):integer;
    begin
      with pilha do begin
        if (qtd = max) then begin
          writeln('Pilha esta cheia!');
          inserirNaPilha:= 0;
        end else begin
          inc(qtd);
          arr[qtd]:= valor;
        end;
      end;
    end;
  procedure inicializarPilha(var pilha: tPilha; tamanho: integer);
  begin
    with pilha do begin
      if (tamanho > 0) then
        max:= tamanho
      else
        max:= pilhaMaxSize;

      qtd:= 0;
      arr[1]:= 0;
    end;
  end;

end.