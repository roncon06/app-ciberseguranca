# 1. Importar as bibliotecas necessárias
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
import matplotlib.pyplot as plt

# 2. Carregar o conjunto de dados
df = pd.read_csv('cs448b_ipasn.csv')

# Visualizar as primeiras linhas do conjunto de dados
print(df.head())

# Exibir informações sobre as colunas e tipos de dados
print(df.info())
print(df.describe())

# 3. Pré-processamento dos dados
# Usaremos 'l_ipn', 'r_asn', e 'f' como variáveis de entrada
X = df[['l_ipn', 'r_asn', 'f']]

# Geração de uma coluna de rótulo fictícia 'Label' (0 = normal, 1 = anômalo)
# Aqui, classificamos como anômalo se o número de fluxos ('f') for maior que um certo valor (ex: 1000)
df['Label'] = (df['f'] > 1000).astype(int)
y = df['Label']  # Coluna alvo

# Normalizar os dados
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Dividir o conjunto de dados em treino e teste
X_train, X_test, y_train, y_test = train_test_split(X_scaled, y, test_size=0.2, random_state=42)

# 4. Definir e compilar o modelo de rede neural
model = Sequential([
    Dense(64, activation='relu', input_shape=(X_train.shape[1],)),
    Dense(32, activation='relu'),
    Dense(1, activation='sigmoid')  # Saída para classificação binária
])

model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])

# 5. Treinar o modelo
history = model.fit(X_train, y_train, epochs=20, batch_size=32, validation_split=0.2)

# 6. Avaliar o modelo
test_loss, test_accuracy = model.evaluate(X_test, y_test)
print(f'Test Accuracy: {test_accuracy:.2f}')

# 7. Visualizar o histórico de treinamento
plt.plot(history.history['accuracy'], label='Acurácia de Treino')
plt.plot(history.history['val_accuracy'], label='Acurácia de Validação')
plt.xlabel('Épocas')
plt.ylabel('Acurácia')
plt.legend()
plt.show()

# 8. Converter e salvar o modelo em TFLite para uso no Flutter
converter = tf.lite.TFLiteConverter.from_keras_model(model)
tflite_model = converter.convert()

# Salvar o modelo em um arquivo
with open('modelo_anomalias.tflite', 'wb') as f:
    f.write(tflite_model)
