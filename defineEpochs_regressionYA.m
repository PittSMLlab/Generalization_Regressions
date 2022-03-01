function [eps] = defineEpochs_regressionYA(nantype)


names={'OG base','TM slow','TM base','Adaptation',...
    'Post1_{Early}','Post1_{Late}','Post2_{Early}','Post2_{Late}',...
    'Post1-Adapt_{SS}','TM_{beforePos}','PosShort_{early}','PosShort_{late}','TM_{afterPos}',...
    'OG_{afterPos}','TM_{beforeNeg}','NegShort_{early}','TM_{afterNeg}',...
    'ShortSplits','NegShort2_{early}','NegShort2_{late}'};
    'PostShort5_{late}','OG_{after5pos}'};


eps=defineEpochs(names,...
                {'OG base','TM slow','TM base','Adaptation',...
                'Post 1','Post 1','Post 2','Post 2',...
                'Post 1','TM mid 1','Pos Short','Pos Short','TM mid 2',...
                'OG 1','TM mid 2','Neg Short','TM mid 3',...
                'OG 2','Multiple Short Splits','Neg Short 2','Neg Short 2'},...
                'OG 2','Pos Short 5','OG 6'},...
                [-40 -40 -40 -40,...
                5 -40 5 -40,...
                5 -40 10 -10 10,...
                10 -40 10 10,...
                10 -40 10 -40],...
                 -10, 10],...
                [0,0,0,0,...
                1,0,1,0,...
                1,0,1,0,1,...
                1,0,1,1,...
                1,0,1,1,...
                1,0,1,5],...
                1,0,1],...
                [5,5,5,5,...
                0,5,0,5,...
                0,5,0,5,0,...
                0,5,0,0,...
                0,5,0,0,...
                0,5,0,5],...
                0,5,0],...
                nantype);