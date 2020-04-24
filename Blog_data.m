% % set seed
% rng('default');
% train_num=round(5196*0.3);
% %randomly select some xx% of nodes to be the test set
% randvec=randperm(5196,train_num);
% % testing matrix and label
% M_test_70=sparse(NetRep_blogcatalog(randvec,:));
% L_test_70=Label(randvec);
% count_vec=1:1:5196;
% count_vec(randvec)=[];
% %training matrix and label
% M_train_70=sparse(NetRep_blogcatalog(count_vec,:));
% L_train_70=Label(count_vec);


% % set seed
% rng('default');
% train_num=round(5196*0.5);
% %randomly select some xx% of nodes to be the test set
% randvec=randperm(5196,train_num);
% % testing matrix and label
% M_test_50=sparse(NetRep_blogcatalog(randvec,:));
% L_test_50=Label(randvec);
% count_vec=1:1:5196;
% count_vec(randvec)=[];
% %training matrix and label
% M_train_50=sparse(NetRep_blogcatalog(count_vec,:));
% L_train_50=Label(count_vec);

% % set seed
% rng('default');
% train_num=round(5196*0.3);
% %randomly select some xx% of nodes to be the test set
% randvec=randperm(5196,train_num);
% % testing matrix and label
% M_test_30=sparse(NetRep_blogcatalog(randvec,:));
% L_test_30=Label(randvec);
% count_vec=1:1:5196;
% count_vec(randvec)=[];
% %training matrix and label
% M_train_30=sparse(NetRep_blogcatalog(count_vec,:));
% L_train_30=Label(count_vec);
%#of iterations
num=20;
% percentage of data used to train
perc=0.9;
a_Sim_10=zeros(1,num);
for i=1:num
train_num=round(5196*perc);
%randomly select some xx% of nodes to be the test set
randvec=randperm(5196,train_num);
% testing matrix and label
M_test_10=sparse(NetRep_blogcatalog(randvec,:));
L_test_10=Label(randvec);
count_vec=1:1:5196;
count_vec(randvec)=[];
%training matrix and label
M_train_10=sparse(NetRep_blogcatalog(count_vec,:));
L_train_10=Label(count_vec);
model_Sim_10 = train(L_train_10, M_train_10, '-s 6','-v 5');
[predict_label, accuracy, prob_estimates]=predict(L_test_10, M_test_10, model_Sim_10,'-b 1');
a_Sim_10(i)=accuracy(3);
end
mean(a_Sim_10)