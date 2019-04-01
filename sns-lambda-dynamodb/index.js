const AWS = require('aws-sdk');
const docClient = new AWS.DynamoDB.DocumentClient({region:'us-east-1'});
exports.handler = (event, context,callback) => {
    //console.log('Received event:', JSON.stringify(event, null, 2));
    var params={
        Item:{
            messageid:event.Records[0].Sns.MessageId,
            message:event.Records[0].Sns.Message
        },
        TableName:'Message'
    };
    docClient.put(params,function(err,data){
        if(err){
        callback(err,null);
        }else{
        callback(null,data);
    }
})};
