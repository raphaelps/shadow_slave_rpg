// Este arquivo pode conter constantes globais para o aplicativo.

// Exemplo: ID do aplicativo para Firebase (obtido de __app_id no ambiente Canvas)
// Esta variável será populada pelo ambiente Canvas em tempo de execução.
// Se estiver rodando localmente sem o ambiente Canvas, use um valor padrão.
const String appId = String.fromEnvironment(
  'APP_ID',
  defaultValue: 'default-app-id',
);

// Outras constantes podem ser adicionadas aqui, como limites de core, etc.
const int maxCoreLevel = 7;
const int initialCoreProgressLimit = 1000; // Limite para o nível 1 do Core
  