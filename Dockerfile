FROM odoo:16.0

# Copie os addons personalizados (se houver)
COPY ./addons /mnt/extra-addons

# Instale dependências do sistema (adicione mais se seu projeto precisar)
USER root
RUN apt-get update && apt-get install -y \
    python3-pip \
    libldap2-dev \
    libsasl2-dev \
    libssl-dev \
    wkhtmltopdf \
    && apt-get clean

USER odoo

# Defina o diretório de trabalho
WORKDIR /var/lib/odoo

# Copie arquivos customizados se precisar
# COPY ./odoo.conf /etc/odoo/odoo.conf

# Por padrão, o Odoo já inicia com o comando abaixo
CMD ["odoo"]
