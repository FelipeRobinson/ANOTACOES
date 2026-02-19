'''
Implementar a opção 2 (procurar contato) da seguinte forma:
Ficar pedindo para digitar um nome até digitar um nome que existe;
mostrar então na tela TODOS os demais dados daquela pessoa, cujo
nome foi digitado.

Implementar a opção 3 (atualizar contato) da seguinte forma:
Ficar mostrando um menu oferecendo as opções de atualizar aniversário, ou
endereco, ou telefone, ou celular, ou email, ou finalizar as
atualizações; ficar pedindo para digitar a opção até digitar uma
opção válida; realizar a atulização solicitada; até ser escolhida a
opção de finalizar as atualizações.

Implementar a opção 4 (listar contato) da seguinte forma:
Mostrar na tela os TODOS os dados de CADA um dos contatos presentes
na lista chamada agenda (eventualmente chamada de agd).

Entregar até domingo, dia 28 de abril de 2024.
'''
def apresenteSe ():
    print('+-------------------------------------------------------------+')
    print('|                                                             |')
    print('| AGENDA PESSOAL DE ANIVERSÁRIOS E FORMAS DE CONTATAR PESSOAS |')
    print('|                                                             |')
    print('|    Alunos Carlos Thiago, Felipe Robinson e Gabriel Zini     |')
    print('|                                                             |')
    print('|                Versão 2.0 de 27/abril/2024                  |')
    print('|                                                             |')
    print('+-------------------------------------------------------------+')

def umTexto (solicitacao, mensagem, valido):
    digitouDireito=False
    while not digitouDireito:
        txt=input(solicitacao)

        if txt not in valido:
            print(mensagem,'- Favor redigitar...')
        else:
            digitouDireito=True

    return txt

def opcaoEscolhida (mnu):
    print ()

    opcoesValidas=[]
    posicao=0
    while posicao<len(mnu):
        print (posicao+1,') ',mnu[posicao],sep='')
        opcoesValidas.append(str(posicao+1))
        posicao+=1

    print()
    return umTexto('Qual é a sua opção? ', 'Opção inválida', opcoesValidas)

'''
procura nom em agd e, se achou, retorna:
uma lista contendo True e a posicao onde achou;
MAS, se não achou, retorna:
uma lista contendo False e a posição onde inserir,
aquilo que foi buscado, mas nao foi encontrado,
mantendo a ordenação da lista.
'''
def ondeEsta (nom,agd):
    inicio=0
    final =len(agd)-1 

    while inicio<=final:
        meio=(inicio+final)//2  

        if nom.upper()==agd[meio][0].upper(): 
            return [True,meio]
        elif nom.upper()<agd[meio][0].upper():
            final=meio-1
        else:
            inicio=meio+1
            
    return [False,inicio]
obtemConexao

def insercao_de_contato(nome, aniversario, endereco, telefone, celular, email):
    tabela = (f"insert into CONTATO (nome, aniversario, endereco, telefone, celular, email) values ('{aniversario}', '{endereco}', '{telefone}', '{celular}')")
    conect = ("{SQL Server}", 
                           "143.106.250.84", 
                           "BDXXXXX", 
                           "BDXXXXX",
                           "CONTATO",)
    cursor = conect.cursor()
    cursor.execute(tabela)
    cursor.commit()

def incluir (agd):
    digitouDireito=False
    while not digitouDireito:
        nome=input('\nNome.......: ')

        resposta=ondeEsta(nome,agd)
        achou   = resposta[0]
        posicao = resposta[1]

        if achou:
            print ('Pessoa já existente - Favor redigitar...')
        else:
            digitouDireito=True

    try:        
        aniversario=input('Aniversário: ')
        endereco   =input('Endereço...: ')
        telefone   =input('Telefone...: ')
        celular    =input('Celular....: ')
        email      =input('e-mail.....: ')
    
        insercao_de_contato (nome,aniversario,endereco,telefone,celular,email)
        print('Cadastro realizado com sucesso!')
    except SQLError:
        print("Nome já cadastrado!")

    agd.insert(posicao,contato)
    print('Cadastro realizado com sucesso!')

def procurar (agd):
    resposta=procuraContinua(agd)
    achou   = resposta[0]
    posicao = resposta[1]
    
    if achou==True:
        print('Aniversario:',agd[posicao][1])
        print('Endereco...:',agd[posicao][2])
        print('Telefone...:',agd[posicao][3])
        print('Celular....:',agd[posicao][4])
        print('e-mail.....:',agd[posicao][5])
    
    # Ficar pedindo para digitar um nome até digitar um nome que existe
    # cadastrado;
    # mostrar então na tela TODOS os demais dados encontrados 
    # sobre aquela pessoa.

'''
Procura pelo contato e se não achar pergunta se quer tentar novamente 
ou desistir de tentar
'''
def procuraContinua(agenda):
    digitouDireito=False
    while not digitouDireito:
        nome=input('Nome.......: ')
        resposta=ondeEsta(nome,agenda)
        achou   = resposta[0]
        posicao = resposta[1]
        
        if not achou:
                print ('Pessoa inexistente ')
                res=input("Gostaria de tentar novamente? Responda S/N : ").upper()
                
                if res in ['s','S']:
                    print()
                    print('Favor Redigitar nome')
                else:
                    return False,posicao        
        
        else:
            digitouDireito=True

    return True,posicao
    
def listarContato(agd,posicao):
    print()
    print("A lista atualizada está da seguinte forma: ")
    print('Nome.......:',agd[posicao][0])
    print('Aniversario:',agd[posicao][1])
    print('Endereco...:',agd[posicao][2])
    print('Telefone...:',agd[posicao][3])
    print('Celular....:',agd[posicao][4])
    print('E-mail.....:',agd[posicao][5])
    print()

def atualizar (agd):
    resposta=procuraContinua(agd)
    achou   = resposta[0]
    posicao = resposta[1]
        
    if achou==True:
        print('Aniversario:',agd[posicao][1])
        print('Endereco...:',agd[posicao][2])
        print('Telefone...:',agd[posicao][3])
        print('Celular....:',agd[posicao][4])
        print('E-mail.....:',agd[posicao][5])
       
        selecionar=['Nome',\
          'Aniversário',\
          'Endereço',\
          'Telefone',\
          'Celular',\
          'E-mail',\
          'Finalizar']
    
        escolher=666
        while escolher!=6:
            
            escolher = int(opcaoEscolhida(selecionar))
            if escolher>7:
                print("Opção inválida!!")
            
            if escolher==1:
                novovalor0=input('Digite o novo nome : ')
                agd[posicao][0]=novovalor0
                listarContato(agd,posicao)
    
    
            elif escolher==2:
                novovalor1=input('Digite o novo aniversário : ')
                agd[posicao][1]=novovalor1
                listarContato(agd,posicao)
                
            elif escolher==3:
                novovalor2=input('Digite o novo endereço : ')
                agd[posicao][2]=novovalor2
                listarContato(agd,posicao)
                 
            elif escolher==4:
                novovalor3=input('Digite o novo telefone : ')
                agd[posicao][3]=novovalor3
                listarContato(agd,posicao)
                
            elif escolher==5:
                novovalor4=input('Digite o novo celular : ')
                agd[posicao][4]=novovalor4
                listarContato(agd,posicao)
                
            elif escolher==6:
                novovalor5=input('Digite o novo e-mail : ')
                agd[posicao][5]=novovalor5
                listarContato(agd,posicao)
                
            elif escolher==7:
                break
    
    
    
    
    # Ficar mostrando um menu oferecendo as opções de atualizar aniversário, ou
    # endereco, ou telefone, ou celular, ou email, ou finalizar as
    # atualizações; ficar pedindo para digitar a opção até digitar uma
    # opção válida; realizar a atulização solicitada; até ser escolhida a
    # opção de finalizar as atualizações.
    # USAR A FUNÇÃO opcaoEscolhida, JÁ IMPLEMENTADA, PARA FAZER O MENU

def listar (agd):
  
    # implementar aqui a listagem de todos os dados de todos
    # os contatos cadastrados
    # printar aviso de que não há contatos cadastrados se
    # esse for o caso
    
    tamanho=len(agd) #agd=numero de linhas
    if tamanho==0:
        print("Não existem contantos cadastrados.")
    else:
        procurando=False
        while not procurando:
            for a in range(0,tamanho):
                print("Nome......:",agd[a][0])
                print('Aniversario:',agd[a][1])
                print("Endereco...:",agd[a][2])
                print("Telefone...:",agd[a][3])
                print("Celular....:",agd[a][4])
                print("e-mail.....:",agd[a][5])
                print()
            procurando=True
    

def excluir (agd):
    print()
    
    digitouDireito=False
    while not digitouDireito:
        nome=input('Nome.......: ')
        
        resposta=ondeEsta(nome,agd)
        achou   = resposta[0]
        posicao = resposta[1]
        
        if not achou:
            print ('Pessoa inexistente - Favor redigitar...')
        else:
            digitouDireito=True
    
    print('Aniversario:',agd[posicao][1])
    print('Endereco...:',agd[posicao][2])
    print('Telefone...:',agd[posicao][3])
    print('Celular....:',agd[posicao][4])
    print('e-mail.....:',agd[posicao][5])

    resposta=umTexto('Deseja realmente excluir? ','Você deve digitar S ou N',['s','S','n','N'])
    
    if resposta in ['s','S']:
        del agd[posicao]
        print('Remoção realizada com sucesso!')
    else:
        print('Remoção não realizada!')

# daqui para cima, definimos subprogramas (ou módulos, é a mesma coisa)
# daqui para baixo, implementamos o programa (nosso CRUD, C=create(inserir), R=read(recuperar), U=update(atualizar), D=delete(remover,apagar)

apresenteSe()

agenda=[]

menu=['Incluir Contato',\
      'Procurar Contato',\
      'Atualizar Contato',\
      'Listar Contatos',\
      'Excluir Contato',\
      'Sair do Programa']

opcao=666
while opcao!=6:
    opcao = int(opcaoEscolhida(menu))

    if opcao==1:
        incluir(agenda)
    elif opcao==2:
        procurar(agenda)
    elif opcao==3:
        atualizar(agenda)
    elif opcao==4:
        listar(agenda)
    elif opcao==5:
        excluir(agenda)
        
print('OBRIGADO POR USAR ESTE PROGRAMA!')