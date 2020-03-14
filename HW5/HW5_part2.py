#!/usr/bin/env python
# coding: utf-8

# In[2]:


import numpy as np
import tensorflow as tf
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.metrics import confusion_matrix


# In[3]:


# Load mnist data
fashion_mnist = tf.keras.datasets.fashion_mnist
(X_train_full, y_train_full), (X_test, y_test) = fashion_mnist.load_data()


# In[4]:


# Convert integer values to floating point numbers and remove 5,000 images to use as validation data
X_valid = X_train_full[:5000] / 255.0
X_train = X_train_full[5000:] / 255.0
X_test = X_test / 255.0

y_valid = y_train_full[:5000]
y_train = y_train_full[5000:]

# Add extra axis
X_train = X_train[..., np.newaxis]
X_valid = X_valid[..., np.newaxis]
X_test = X_test[..., np.newaxis]


# In[132]:


from functools import partial

my_dense_layer = partial(tf.keras.layers.Dense, activation="relu", kernel_regularizer=tf.keras.regularizers.l2(0.0002))
my_conv_layer = partial(tf.keras.layers.Conv2D, activation="relu", padding="same")

model2 = tf.keras.models.Sequential([
    my_conv_layer(64,3,padding="same",input_shape=[28,28,1]),
    tf.keras.layers.MaxPool2D(),
    my_conv_layer(64,3),
    my_conv_layer(64,3),
    tf.keras.layers.MaxPool2D(),
    tf.keras.layers.Flatten(),
    my_dense_layer(300),
    my_dense_layer(10, activation="softmax")
])


# In[133]:


model2.compile(loss="sparse_categorical_crossentropy",
              optimizer=tf.keras.optimizers.Adam(learning_rate=0.0005),
              metrics=["accuracy"])


# In[134]:


history = model2.fit(X_train, y_train, epochs=5, validation_data=(X_valid,y_valid))


# In[120]:


pd.DataFrame(history.history).plot(figsize=(8,5))
plt.grid(True)
plt.gca().set_ylim(0,1)
plt.show()


# In[137]:


y_pred = model2.predict_classes(X_test)
conf_test = confusion_matrix(y_test, y_pred)
print(conf_test)


# In[145]:


fig, ax = plt.subplots()

# hide axes
fig.patch.set_visible(False)
ax.axis('off')
ax.axis('tight')

# create table and save to file
df = pd.DataFrame(conf_test)
ax.table(cellText = df.values, rowLabels = np.arange(10), colLabels = np.arange(10), loc = 'center', colLoc = 'center')
fig.tight_layout()
plt.savefig('conf_mat_part_2.png')


# In[ ]:




