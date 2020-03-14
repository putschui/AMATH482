#!/usr/bin/env python
# coding: utf-8

# In[504]:


import numpy as np
import tensorflow as tf
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.metrics import confusion_matrix


# In[505]:


# Load mnist data
fashion_mnist = tf.keras.datasets.fashion_mnist
(X_train_full, y_train_full), (X_test, y_test) = fashion_mnist.load_data()


# In[506]:


# Convert integer values to floating point numbers and remove 5,000 images to use as validation data
X_valid = X_train_full[:5000] / 255.0
X_train = X_train_full[5000:] / 255.0
X_test = X_test / 255.0

y_valid = y_train_full[:5000]
y_train = y_train_full[5000:]


# In[564]:


from functools import partial

my_dense_layer = partial(tf.keras.layers.Dense, activation="relu", kernel_regularizer=tf.keras.regularizers.l2(0.0001))

model1 = tf.keras.models.Sequential([
    tf.keras.layers.Flatten(input_shape=[28, 28]),
    my_dense_layer(500),
    my_dense_layer(400),
    my_dense_layer(300),
    my_dense_layer(100),
    my_dense_layer(10, activation="softmax")
])


# In[565]:


model1.compile(loss="sparse_categorical_crossentropy",
              optimizer=tf.keras.optimizers.Adam(learning_rate=0.0002),
              metrics=["accuracy"])


# In[566]:


history = model1.fit(X_train, y_train, epochs=5, validation_data=(X_valid,y_valid))


# In[567]:


pd.DataFrame(history.history).plot(figsize=(8,5))
plt.grid(True)
plt.gca().set_ylim(0,1)
plt.show()


# In[568]:


y_pred = model1.predict_classes(X_test)
conf_test = confusion_matrix(y_test, y_pred)
print(conf_test)


# In[569]:


np.sum(y_pred == y_test)/y_test.size


# In[570]:


fig, ax = plt.subplots()

# hide axes
fig.patch.set_visible(False)
ax.axis('off')
ax.axis('tight')

# create table and save to file
df = pd.DataFrame(conf_test)
ax.table(cellText = df.values, rowLabels = np.arange(10), colLabels = np.arange(10), loc = 'center', colLoc = 'center')
fig.tight_layout()
plt.savefig('conf_mat_part_1.png')


# In[ ]:




