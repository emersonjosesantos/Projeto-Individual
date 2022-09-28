var database = require("../database/config");


function votar(fk_personagem, fk_usuario){
    instrucaoSql = `
        INSERT INTO votoPersonagem VALUES
            (null, ${fk_personagem}, ${fk_usuario})`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarUltimasMedidas() {
    instrucaoSql = `
        SELECT 
            personagem.nome, round(count(votoPersonagem.fk_personagem) / (SELECT count(*) FROM votoPersonagem) * 100, 1) as porcentagem
                FROM votoPersonagem
                    JOIN personagem
                        ON votoPersonagem.fk_personagem = personagem.id
                    JOIN usuario
                        ON votoPersonagem.fk_usuario = usuario.id
                            GROUP BY votoPersonagem.fk_personagem`

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idPersonagem) {
    instrucaoSql = `select 
    select nomePersonagem, count(fk_personagem) as id from Personagem
    join usuario
    on fk_personagem = ${idPersonagem}
    group by fk_personagem
    order by fk_personagem`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    votar,
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}