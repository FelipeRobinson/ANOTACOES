def atores_de_flms_que_dura_entre (durMin, durMax, flms, atrs):
    nms_q_servem = []
    ids_q_servem = []

    for f in flms:
        for ["Duracao"] >= durMin and f["Duracao"] <= durMax:
            for Id in f["Ator"]:
                if Id not in ids_q_servem:
                    for a in atrs:
                        if Id = a["Id"]:
                            nms_q_servem.append(a["Nome"])
                            ids_q_servem.append(a["Id"])
    
    return nms_q_servem


print(atores_de_flms_que_dura_entre)