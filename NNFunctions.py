# Import checkpoint dependencies
import tensorflow as tf
import os
from tensorflow.keras.callbacks import ModelCheckpoint



def setup_nn_model(input_features:int, layer1:int, layer2:int, add_layers:int, 
                   actv_fun1:str, actv_func2:str, output_func:str,)->float:

    # Define the model - deep neural net, i.e., the number of input features and hidden nodes for each layer.
    number_input_features = input_features
    hidden_nodes_layer1 = layer1
    hidden_nodes_layer2 = layer2

    nn = tf.keras.models.Sequential()

    # First hidden layer
    nn.add(tf.keras.layers.Dense(units=hidden_nodes_layer1, input_dim=number_input_features ,activation=actv_fun1))

    # Second hidden layer
    nn.add(
        tf.keras.layers.Dense(units=hidden_nodes_layer2, activation=actv_func2 )
    )
    while (add_layers != 0): #Keep adding new layers as specified in input parameters
        nn.add(
        tf.keras.layers.Dense(units=hidden_nodes_layer2, activation=actv_func2 )
       )
        add_layers = add_layers - 1
        
    # Output layer
    nn.add(tf.keras.layers.Dense(units=1, activation=output_func))
    
    return nn

# Define a Training Function for the Neural Network
def train_nn(model:float, num_epochs:int):
    
    # Define the checkpoint path and filenames
    os.makedirs("checkpoints/",exist_ok=True)
    checkpoint_path = "checkpoints/weights.{epoch:02d}.hdf5"

    # Create a callback that saves the model's weights every 'n' epochs
    cp_callback = ModelCheckpoint(
        filepath=checkpoint_path,
        verbose=1,
        save_weights_only=True,
        save_freq=50000)
    
    # Compile the model
    model.compile(loss="binary_crossentropy",optimizer="adam",metrics=["accuracy"])
    
    # Train the model
    fit_model = model.fit(X_train_scaled, y_train, epochs=num_epochs, callbacks=[cp_callback])
    
    # Evaluate the model using the test data
    model_loss, model_accuracy = nn.evaluate(X_test_scaled,y_test,verbose=2)
    print(f"Loss: {model_loss}, Accuracy: {model_accuracy}")
    
    # Export our model to HDF5 file
    model.save("CustReordering.h5")