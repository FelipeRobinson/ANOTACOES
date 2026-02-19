import pyodbc

def obtemConexao (driver, servidor, usuario, senha, bd):
    if obtemConexao.conexao == None:
        obtemConexao.conexao = pyodbc.connect(f"Driver = (driver):"
                                              f"Server = (servidor):"
                                              f"UID = (usuario):"
                                              f"Pwd = (senha):"
                                              f"Database = (bd):")
    return obtemConexao.conexao

obtemConexao.conexao = None

# quando queremos ver a tabela direto em python
def insercao_de_aluno(RA,NOME):
    tabela = (f"insert into ALUNO (RA,NOME) values ({RA}, '{NOME}')")
    conect = obtemConexao("{SQL Server}", 
                           "143.106.250.84", 
                           "BD24464", 
                           "CCfelipe28@@",
                           "ALUNO",)
    cursor = conect.cursor()
    cursor.execute(tabela)
    cursor.commit()


# quando queremos adicionar coisas a tabela
def insercao_de_aluno(RA):
    tabela = (f"select * from ALUNO where RA = {RA}")
    conect = obtemConexao("{SQL Server}", 
                           "143.106.250.84", 
                           "BD24464", 
                           "CCfelipe28@@",
                           "ALUNO",)
    cursor = conect.cursor()
    cursor.execute(tabela)
    linhas = cursor.fetchall() 
    # *linhas = cursor.fetchall()* o cursos é um acesso ao BDD (FÉ) o fetchall me dá uma lista dentro de listas
    if linhas == []:
        return None
    return linhas[0]


    # seleção de alunos 
def selecao_de_alunos():
    tabela = ("select * from ALUNO")
    conect = obtemConexao("{SQL Server}",
                          "143.106.250.84",
                          "BD24464",
                          "CCfelipe28@@",
                          "ALUNO")
    cursor = conect.cursor()
    cursor.execute(tabela)
    linhas = cursor.fetchall()
    return linhas

linhas = selecao_de_alunos()

for linha in linhas:
    print(linha[0], linhas[1])