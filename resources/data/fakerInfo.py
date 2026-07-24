from faker import Faker

fake = Faker()
fake_br = Faker('pt_BR')

def get_variables():
    # Retorna um dicionário onde as chaves serão as variáveis no Robot
    return {
        "TITULO": fake_br.random_element(elements=("Mr", "Mrs")),
        "FAKE_NOME": fake_br.name(),
        "FAKE_EMAIL": fake_br.email(),
        "FAKE_SENHA": fake_br.password(),
        "FAKE_DIA_NASCIMENTO": str(int(fake_br.day_of_month())),
        "FAKE_MES_NASCIMENTO": str(int(fake_br.month())),
        "FAKE_ANO_NASCIMENTO": str(fake_br.random_int(min=1900, max=2021)),
        "FAKE_PRIMEIRO_NOME": fake_br.first_name(),
        "FAKE_ULTIMO_NOME": fake_br.last_name(),
        "FAKE_EMPRESA": fake_br.company(),
        "FAKE_ENDERECO1": fake_br.street_address(),
        "FAKE_ENDERECO2": fake_br.street_address(),
        "FAKE_PAIS": fake_br.random_element(elements=("India", "United States", "Canada", "Australia", "Israel", "New Zealand", "Singapore")),
        "FAKE_ESTADO": fake_br.state(),
        "FAKE_CIDADE": fake_br.city(),
        "FAKE_CEP": fake_br.postcode(),
        "FAKE_CELULAR": fake_br.phone_number(),
    }