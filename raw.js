const fs = require('fs');
const path = require('path');

const STORAGE_DIR = path.join('/tmp', 'apibot');

exports.handler = async (event, context) => {
  try {
    // Parse URL path: /:apiKey/v1/:randomId
    // Netlify Function path: /.netlify/functions/raw/:apiKey/v1/:randomId
    const pathSegments = event.path.split('/').filter(Boolean);
    
    // Tìm apiKey và randomId từ path
    let apiKey, randomId;
    
    // Nếu gọi từ redirect rule
    if (event.queryStringParameters?.apiKey && event.queryStringParameters?.randomId) {
      apiKey = event.queryStringParameters.apiKey;
      randomId = event.queryStringParameters.randomId;
    } else {
      // Parse từ path
      const v1Index = pathSegments.indexOf('v1');
      if (v1Index > 0) {
        apiKey = pathSegments[v1Index - 1];
        randomId = pathSegments[v1Index + 1];
      }
    }

    if (!apiKey || !randomId) {
      return {
        statusCode: 400,
        body: JSON.stringify({ error: 'Missing apiKey or randomId' })
      };
    }

    const filePath = path.join(STORAGE_DIR, apiKey, 'v1', `${randomId}.txt`);

    // Security check
    if (!filePath.startsWith(STORAGE_DIR)) {
      return {
        statusCode: 403,
        body: JSON.stringify({ error: 'Forbidden' })
      };
    }

    if (!fs.existsSync(filePath)) {
      return {
        statusCode: 404,
        body: JSON.stringify({ error: 'Link not found' })
      };
    }

    const fileContent = fs.readFileSync(filePath, 'utf-8');
    const data = JSON.parse(fileContent);

    return {
      statusCode: 200,
      headers: {
        'Content-Type': data.contentType || 'text/plain',
        'Access-Control-Allow-Origin': '*'
      },
      body: data.content
    };
  } catch (error) {
    console.error('Error:', error);
    return {
      statusCode: 500,
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ error: error.message })
    };
  }
};
