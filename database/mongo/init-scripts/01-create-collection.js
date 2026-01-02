db = db.getSiblingDB('db_points');

db.products.insertMany([
    {
        name: "Camisinha de Treino Boleiros",
        category: "VESTUARIO",
        description: "Colete de nylon para separação de times",
        points_cost: 500,
        stock_quantity: 50,
        active: true,
        created_at: new Date()
    },
    {
        name: "Squeeze de Alumínio",
        category: "ACESSORIOS",
        description: "Garrafa térmica 500ml",
        points_cost: 1200,
        stock_quantity: 20,
        active: true,
        created_at: new Date()
    }
]);

db.transactions.insertOne({
    user_id: "00000000-0000-0000-0000-000000000101",
    user_role: "ROLE_PLAYER",
    points_base: 100,
    bonus_percentage: 20,
    points_final: 120,
    transaction_type: "EARN",
    status: "CONFIRMED",
    created_at: new Date()
});

print('Dados iniciais inseridos com sucesso!');