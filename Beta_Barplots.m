%colors
    poster_colors;
    colorOrder=[[0.4940 0.1840 0.5560];[0.9290 0.6940 0.1250]; [0.4660 0.6740 0.1880]];
    
groupID={'ATR','ATS'};


for t=1

figure 
for g=1:length(groupID)

    if contains(groupID{g},'A')
        load(['/Users/dulcemariscal/Documents/GitHub/Generalization_Regressions/RegressionAnalysis/RegModelResults_22-01-20/GroupResults/',groupID{g},'defaultsplit_1flip_1_group_models_ver00.mat'])
    else
        load(['/Users/dulcemariscal/Documents/GitHub/R01/RegressionAnalysis/RegModelResults_22-01-20/GroupResults/',groupID{g},'default_split1asym_1_group_models_ver00.mat'])
    end
         
    transition={fitTrans1NoConst, fitTrans2NoConst, fitTrans3NoConst};
    
    for b=1:3
    
        hold on
        
        if mod(g,2)
            x=[1:3];
        else
            x=[5:7];
        end
        
        if mod(g,2)
            bar(x(b),abs(transition{t}.Coefficients.Estimate(b)),'FaceColor',colorOrder(b,:))
        else
            bar(x(b),abs(transition{t}.Coefficients.Estimate(b)),'FaceColor','w','EdgeColor',colorOrder(b,:))
        end
        
        errorbar(x(b),abs(transition{t}.Coefficients.Estimate(b)),transition{t}.Coefficients.SE(b),'k')

    end

end
title(['Transition', num2str(t)])
ylabel('|\beta|')
xticks([1 2 3 5 6 7])
xticklabels({'\beta_{adapt}','\beta_{non-adapt}','\beta_{env}','\beta_{adapt}','\beta_{non-adapt}','\beta_{env}'})
set(gcf,'color','w');
legend('Learning','Generalization')
axis([0 8 -0.1 1.5])
end

%%

groupID={'NTS','NTR','ATS'};
colorOrder=[[0.4940 0.1840 0.5560];[0.9290 0.6940 0.1250]; [0.4660 0.6740 0.1880]];
b=[];
for i=1:length(groupID)
    %     load(['GroupRegression00_',groupID{i},'.mat'])
    if contains(groupID{i},'A')
        load(['/Users/dulcemariscal/Documents/GitHub/Generalization_Regressions/RegressionAnalysis/RegModelResults_22-01-20/GroupResults/',groupID{i},'defaultsplit_1flip_1_group_models_ver00.mat'])
    else
        load(['/Users/dulcemariscal/Documents/GitHub/R01/RegressionAnalysis/RegModelResults_22-01-20/GroupResults/',groupID{i},'default_split1asym_1_group_models_ver00.mat'])
        
    end
    
    figure
    
    for tr=1:3
        hold on
%         eval(['data= trans',num2str(tr)]);
        transition={fitTrans1NoConst, fitTrans2NoConst, fitTrans3NoConst};
        
        data= transition{tr};
        
        betas_order={1:3, 5:7, 9:11};
        c=0;
        for beta=betas_order{tr}
            c=c+1;
            if (contains(groupID{i}, 'TR'))
                b{c}=bar(beta,abs(data.Coefficients.Estimate(c)), 'FaceColor' ,colorOrder(c,:));
             
            elseif (contains(groupID{i}, 'TS'))
                
                b{c}=bar(beta,abs(data.Coefficients.Estimate(c)), 'FaceColor','w','EdgeColor',colorOrder(c,:));
%                 errorbar(beta, abs(data.Coefficients.Estimate(c)),abs(trans1.Coefficients.SE(c)),'k')
            end
               errorbar(beta, abs(data.Coefficients.Estimate(c)),abs(data.Coefficients.SE(c)),'k')
            
        end
        
    end
    
    title(groupID{i})
    legend([b{:}],'\beta_{adapt}','\beta_{noadapt}','\beta_{env}')
    ylabel('|\beta|')
    xticks([2 6 10])
    xticklabels({'Trans 1: Long Split','Trans 2: Env Changes','Trans 3: Short Split '})
    set(gcf,'color','w');
      
end
%% Bootstrapping plot  
%%
%Betas 

date= '22-01-20';

colorOrder=[[0.4940 0.1840 0.5560];[0.9290 0.6940 0.1250]; [0.4660 0.6740 0.1880]];


groupID={'ATS','ATR'};

betas={'\beta_{adapt}','\beta_{noadapt}','\beta_{env}'};
for tr=1:3
     fh=figure('Units','Normalized','OuterPosition',[0 0 1 1],'NumberTitle', 'off', 'Name',['Trans', num2str(tr)]);
    for b=1:3
        subplot(1,3,b)
        hold on
        for i=1:length(groupID)
            %     load(['GroupRegression00_',groupID{i},'.mat'])
            if contains(groupID{i},'TS')
                load(['/Users/dulcemariscal/Documents/GitHub/Generalization_Regressions/RegressionAnalysis/RegModelResults_', date '/BootstrappingResults/',groupID{i},'_group_iterations_500_numberOfSub_4.mat'])
            else
                load(['/Users/dulcemariscal/Documents/GitHub/Generalization_Regressions/RegressionAnalysis/RegModelResults_', date '/BootstrappingResults/',groupID{i},'_group_iterations_500_numberOfSub_4.mat'])
                
            end
            
            
           eval(['histogram(Trans' num2str(tr) '.betas(:,b))']);
            
        end
        
        title(betas{b})
        legend(groupID{:})
        ylabel('|\beta|')
        set(gcf,'color','w');
        
    end
end

%%
%R^2
groupID={'ATS','ATR'};

betas={'R^{2}_{Ord}','R^{2}_{Adj}'};

for tr=1:3
    fh=figure('Units','Normalized','OuterPosition',[0 0 1 1],'NumberTitle', 'off', 'Name',['Trans', num2str(tr)]);
    for r=1:2
        subplot(1,2,r)
        hold on
        for i=1:length(groupID)
            %     load(['GroupRegression00_',groupID{i},'.mat'])
            if contains(groupID{i},'TS')
                load(['/Users/dulcemariscal/Documents/GitHub/Generalization_Regressions/RegressionAnalysis/RegModelResults_', date '/BootstrappingResults/',groupID{i},'_group_iterations_500_numberOfSub_4.mat'])
            else
                load(['/Users/dulcemariscal/Documents/GitHub/Generalization_Regressions/RegressionAnalysis/RegModelResults_', date '/BootstrappingResults/',groupID{i},'_group_iterations_500_numberOfSub_4.mat'])
                
            end
            
            if r==1
                eval(['histogram(Trans' num2str(tr) '.Rsquared_Ord)']);
            else
                eval(['histogram(Trans' num2str(tr) '.Rsquared_Adj)']);
            end
        end
        
        title(betas{r})
        legend(groupID{:})
        ylabel('R^{2}')
        set(gcf,'color','w');
        
    end
end

%%
%Norm AF
groupID={'ATS','ATR'};

fh=figure('Units','Normalized','OuterPosition',[0 0 1 1],'NumberTitle', 'off', 'Name','AfterEffects');

hold on
for i=1:length(groupID)
    %     load(['GroupRegression00_',groupID{i},'.mat'])
    if contains(groupID{i},'TS')
        load(['/Users/dulcemariscal/Documents/GitHub/Generalization_Regressions/RegressionAnalysis/RegModelResults_', date '/BootstrappingResults/',groupID{i},'_group_iterations_500_numberOfSub_4.mat'])
    else
        load(['/Users/dulcemariscal/Documents/GitHub/Generalization_Regressions/RegressionAnalysis/RegModelResults_', date '/BootstrappingResults/',groupID{i},'_group_iterations_500_numberOfSub_4.mat'])
        
    end
 
    histogram(Norm_AF)

end

title('|EMG_{AF}|')
legend(groupID{:})
ylabel('|\DeltaEMG|')
set(gcf,'color','w');
        

%% 
%Norm regressors 


fh=figure('Units','Normalized','OuterPosition',[0 0 1 1],'NumberTitle', 'off', 'Name','Regressors');
regressors={'Adapt','NoAdapt','EnvSwitch','Trans1','Trans2','Trans3'};

for b=1:6
    subplot(1,6,b)
    hold on
    for i=1:length(groupID)
        %     load(['GroupRegression00_',groupID{i},'.mat'])
        if contains(groupID{i},'TS')
            load(['/Users/dulcemariscal/Documents/GitHub/Generalization_Regressions/RegressionAnalysis/RegModelResults_', date '/BootstrappingResults/',groupID{i},'_group_iterations_500_numberOfSub_4.mat'])
        else
            load(['/Users/dulcemariscal/Documents/GitHub/Generalization_Regressions/RegressionAnalysis/RegModelResults_', date '/BootstrappingResults/',groupID{i},'_group_iterations_500_numberOfSub_4.mat'])
            
        end
        
        
        histogram(Norm_Regressors(:,b))
        
    end
    
    title(regressors{b})
    legend(groupID{:})
    ylabel('|\DeltaEMG|')
    set(gcf,'color','w');
    
end




