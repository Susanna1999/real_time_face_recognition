#!/bin/bash

# usage: copy this sample file to your working dir and execute
# qsub sample_script_serial.sh
# after modifying necessary options.
# requesting options of sge start with #$
# feel free to modify any below to fulfill task requirement

#$ -N facenet-training
#$ -cwd

# merge stdo and stde to one file
#$ -j y

# preserving your environment if necessary
#$ -V

# resource requesting, e.g. for gpu use 
#$ -l gpu=1

# start whatever your job below, e.g., python, matlab, etc.
python src/train_softmax.py --logs_base_dir ../log --models_base_dir ../models --data_dir ../CASIA-WebFace_align_182/ --image_size 160 --model_def models.inception_resnet_v1 --lfw_dir ../lfw_align_160/ --optimizer ADAM --learning_rate -1 --max_nrof_epochs 150 --keep_probability 0.8 --random_crop --random_flip --use_fixed_image_standardization --learning_rate_schedule_file data/learning_rate_schedule_classifier_casia.txt --weight_decay 5e-4 --embedding_size 512 --lfw_distance_metric 1 --lfw_use_flipped_images --lfw_subtract_mean --validation_set_split_ratio 0.05 --validate_every_n_epochs 5 --prelogits_norm_loss_factor 5e-4

hostname;
echo 'Done.'
