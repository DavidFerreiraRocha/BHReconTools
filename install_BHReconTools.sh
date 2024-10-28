#!/bin/bash

cd /root
# Função para verificar e instalar pacotes
install_if_not_exists() {
    if ! command -v "$1" &> /dev/null; then
        echo "$1 não está instalado. Instalando $1..."
        apt update && apt install -y "$1"
    else
        echo "$1 já está instalado."
    fi
}

# Verificar e instalar pacotes necessários
install_if_not_exists "python3"
install_if_not_exists "python3-pip"
install_if_not_exists "git"
install_if_not_exists "wget"
install_if_not_exists "curl"
install_if_not_exists "unzip"


# Verificar se o Go está instalado
if ! command -v go &> /dev/null; then
    echo "Go não está instalado. Instalando Go..."
    wget https://go.dev/dl/go1.23.2.linux-amd64.tar.gz -O /tmp/go.tar.gz
    tar -C /usr/local -xzf /tmp/go.tar.gz
    export PATH=$PATH:/usr/local/go/bin
    echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
    source ~/.bashrc
else
    echo "Go já está instalado."
fi

# Instalar aplicativos Go e mover para /usr/bin
go install github.com/tomnomnom/assetfinder@latest
mv ~/go/bin/assetfinder /usr/bin

go install -v github.com/tomnomnom/anew@latest
mv ~/go/bin/anew /usr/bin

# FINDOMAIN
curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux-i386.zip
unzip findomain-linux-i386.zip
chmod +x findomain
mv findomain /usr/bin/findomain

# DNSX
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
mv ~/go/bin/dnsx /usr/bin

#GAUPLUS
go install github.com/bp0lr/gauplus@latest
mv ~/go/bin/gauplus /usr/bin

#GOOP
go install github.com/deletescape/goop@latest
mv ~/go/bin/goop /usr/bin

#HACKCHECKURL
go install github.com/hakluke/hakcheckurl@latest
mv /root/go/bin/hakcheckurl /usr/bin

#KNOCK
cd /opt
git clone https://github.com/guelfoweb/knock.git
cd knock
pip install .
pip3 install -r requirements.txt --break-system-packages
cd /root

#PHOTON
cd /opt
git clone https://github.com/s0md3v/Photon.git
cd Photon/
pip3 install -r requirements.txt --break-system-packages
cd /root

#MEG
go install github.com/tomnomnom/meg@latest
mv ~/go/bin/meg /usr/bin/

#SUBFINDER
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
mv ~/go/bin/subfinder /usr/bin

#WAYBACKURLS
go install github.com/tomnomnom/waybackurls@latest
mv ~/go/bin/waybackurls /usr/bin

#SODOMY
cd /opt
git clone --recursive https://github.com/screetsec/Sudomy.git
cd Sudomy
pip3 install -r requirements.txt --break-system-packages
cd /root

#URO
pip3 install uro --break-system-packages


#NUCLEI
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
mv ~/go/bin/nuclei /usr/bin/
#INSTALAR TEMPLATES NUCLEI
nuclei

#FREQ
go install github.com/takshal/freq@latest
mv ~/go/bin/freq /usr/bin

#SDLOOKUP
go install github.com/j3ssie/sdlookup@latest
mv ~/go/bin/sdlookup /usr/bin

#DNSVALIDATOR
cd /opt
git clone https://github.com/vortexau/dnsvalidator.git
cd dnsvalidator
pip3 install -r requirements.txt --break-system-packages
python3 setup.py install
cd /root

#PUREDNS
go install github.com/d3mondev/puredns/v2@latest
mv ~/go/bin/puredns /usr/bin/

#XURLFINDER
go install -v github.com/hueristiq/xurlfind3r/cmd/xurlfind3r@latest
mv ~/go/bin/xurlfind3r /usr/bin/

#AIRIXSS
go install github.com/ferreiraklet/airixss@latest
mv ~/go/bin/airixss /usr/bin

#Dependencias do AIRIXSS
pip3 install bhedak --break-system-packages
go install github.com/tomnomnom/qsreplace@latest

#NILO
go install github.com/ferreiraklet/nilo@latest
mv ~/go/bin/nilo /usr/bin/

#TRUFFLEHOG
cd /opt
git clone https://github.com/trufflesecurity/trufflehog.git
cd trufflehog; go install
mv /root/go/bin/trufflehog /usr/bin
cd /root

#HTTPX
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
mv /root/go/bin/httpx /usr/bin

#SUBJS
go install -v github.com/lc/subjs@latest
mv ~/go/bin/subjs /usr/bin

#JSUBFINDER
go install github.com/ThreatUnkown/jsubfinder@latest
mv ~/go/bin/jsubfinder /usr/bin

# Clonar JSScanner e instalar dependências
cd /opt
git clone https://github.com/0x240x23elu/JSScanner.git
cd JSScanner
pip3 install -r requirements.txt --break-system-packages
cd /root

# Instalar getJS
go install github.com/003random/getJS/v2@latest
mv /root/go/bin/getJS /usr/bin

echo "Todas as ferramentas foram instaladas com sucesso!"
