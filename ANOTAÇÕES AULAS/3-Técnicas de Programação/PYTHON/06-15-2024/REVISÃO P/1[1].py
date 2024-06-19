def atores_so_de_flms_maiores_que (dur, flms, atrs):
    atrs_que_ja_atuaram   = []
    atrs_de_filmes_curtos = []
    # a lógica é: os atores que ja atuaram (ou seja, todos) e estão em filmes curtos, não atuaram em filmes longos...

    for a in atrs:
        for f in flms:
            if a["Id"] in f["Ator"]:
                if a["Id"] not in atrs_que_ja_atuaram:
                    atrs_que_ja_atuaram.append(a["Id"])
                if f["Duracao"] < dur:
                    if a["Id"] not in atrs_de_filmes_curtos:
                        atrs_de_filmes_curtos.append(a["Id"])
    return atrs_que_ja_atuaram
    
    '''
    quando esses "for" terminarem, as listas "atrs_que_ja_atuaram" & "atrs_de_filmes_curtos" 
    estará pronta para ser usada (receber parametros e ordens)
    '''