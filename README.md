# CESAE Infrastructure Project

Este projeto contém a infraestrutura como código (IaC) para o ambiente CESAE utilizando Terraform.

## Passos Iniciais

1º

```sh
aws configure
```

2º

Criar buckets no AWS (Para armazenar os statefiles)

Criar table lock

psantos10-eu-west-1-cesae-devops-2025-terraform-lock

3º Criar Identity Provider na AWS
https://aws.amazon.com/blogs/security/use-iam-roles-to-connect-github-actions-to-actions-in-aws/

## Estrutura do Projeto

```
.
├── backend.tf                # Configuração do backend do Terraform
├── main.tf                   # Arquivo principal que chama os módulos
├── provider.tf               # Configuração do provider AWS
├── variables.tf              # Definição de variáveis
├── outputs.tf                # Outputs do projeto
├── user_data.sh              # Script de inicialização das instâncias EC2
├── envs/                     # Ambientes
│   ├── develop/              # Ambiente de desenvolvimento
│   │   └── terraform.tfvars  # Variáveis específicas do ambiente de desenvolvimento
│   └── production/           # Ambiente de produção
│       └── terraform.tfvars  # Variáveis específicas do ambiente de produção
├── modules/                  # Módulos reutilizáveis
│   ├── ec2_instance/         # Módulo de instância EC2
│   │   └── main.tf           # Definição do módulo EC2
│   ├── s3_bucket/            # Módulo de bucket S3
│   │   └── main.tf           # Definição do módulo S3
│   └── security_group/       # Módulo de security group
│       └── main.tf           # Definição do módulo security group
└── sshkeys/                  # Chaves SSH
    └── psantos.pub           # Chave pública SSH
```

## Como usar

1. **Configurar variáveis**:

   - Edite os arquivos `envs/<ambiente>/terraform.tfvars` conforme necessário

2. **Inicializar o Terraform**:

   ```bash
   terraform init -backend-config=envs/<ambiente>/backend.tfvars
   ```

3. **Planejar as mudanças**:

   ```bash
   terraform plan -var-file=envs/<ambiente>/terraform.tfvars
   ```

4. **Aplicar as mudanças**:
   ```bash
   terraform apply -var-file=envs/<ambiente>/terraform.tfvars
   ```

## Módulos

### EC2 Instance

Módulo responsável por criar instâncias EC2.

**Variáveis**:

- `instance_ami`: AMI da instância EC2
- `instance_type`: Tipo da instância EC2
- `security_group_id`: ID do security group
- `key_name`: Nome da chave SSH
- `user_data_script`: Caminho para o script de user data

### Security Group

Módulo responsável por criar security groups.

**Variáveis**:

- `name`: Nome do security group
- `description`: Descrição do security group

### S3 Bucket

Módulo responsável por criar buckets S3.

**Variáveis**:

- `bucket_name`: Nome do bucket S3
