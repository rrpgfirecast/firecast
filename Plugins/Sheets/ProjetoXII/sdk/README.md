# API do SDK 3 (Software Development Kit)

O motor de funcionamento do SDK3 é dividido entre duas entidades:

- Código binário em pascal, embutido no rrpg.exe ou FirecastMobile
- Código lua que faz a ponte entre seu código .lua e o código binário.

Esta pasta contém o código lua que faz a ponte entre os dois mundos!

Observação: Quando você realiza o comando "rdk p", o conteúdo desta pasta é copiado para a subpasta /sdk do seu projeto.