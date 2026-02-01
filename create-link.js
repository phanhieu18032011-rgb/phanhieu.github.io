const crypto = require('crypto');
const fs = require('fs');
const path = require('path');

// Sử dụng tmp directory trên Netlify
const STORAGE_DIR = path.join('/tmp', 'apibot');

// Đảm bảo thư mục tồn tại
if (!fs.existsSync(STORAGE_DIR)) {
  fs.mkdirSync(STORAGE_DIR, { recursive: true });
}

function generateApiKey() {
  return crypto.randomBytes(16).toString('hex');
}

function generateRandomSuffix() {
  return crypto.randomBytes(8).toString('hex');
}

function createApiStructure(apiKey) {
  const apiDir = path.join(STORAGE_DIR, apiKey);
  const v1Dir = path.join(apiDir, 'v1');
  
  if (!fs.existsSync(apiDir)) {
    fs.mkdirSync(apiDir, { recursive: true });
  }
  
  if (!fs.existsSync(v1Dir)) {
    fs.mkdirSync(v1Dir, { recursive: true });
  }
  
  return { apiDir, v1Dir };
}

exports.handler = async (event, context) => {
  try {
    // Xử lý CORS
    const headers = {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
      'Content-Type': 'application/json'
    };

    // Xử lý preflight request
    if (event.httpMethod === 'OPTIONS') {
      return {
        statusCode: 200,
        headers,
        body: JSON.stringify({ success: true })
      };
    }

    if (event.httpMethod !== 'POST') {
      return {
        statusCode: 405,
        headers,
        body: JSON.stringify({ error: 'Method not allowed' })
      };
    }

    const body = JSON.parse(event.body || '{}');
    const { content = '', contentType = 'text/plain' } = body;

    if (!content) {
      return {
        statusCode: 400,
        headers,
        body: JSON.stringify({ error: 'Content is required' })
      };
    }

    // Generate API key và random suffix
    const apiKey = generateApiKey();
    const randomSuffix = generateRandomSuffix();

    // Tạo thư mục
    const { v1Dir } = createApiStructure(apiKey);

    // Lưu file
    const fileName = `${randomSuffix}.txt`;
    const filePath = path.join(v1Dir, fileName);

    const fileData = {
      timestamp: new Date().toISOString(),
      contentType,
      content
    };

    fs.writeFileSync(filePath, JSON.stringify(fileData, null, 2));

    // Lấy domain từ environment hoặc từ request
    const protocol = process.env.URL ? 'https' : 'http';
    const domain = process.env.URL?.replace('https://', '').replace('http://', '') || 'localhost:8000';
    
    const rawLink = `${protocol}://${domain}/${apiKey}/v1/${randomSuffix}`;

    return {
      statusCode: 200,
      headers,
      body: JSON.stringify({
        success: true,
        apiKey,
        randomSuffix,
        link: rawLink,
        filePath: `/tmp/apibot/${apiKey}/v1/${fileName}`
      })
    };
  } catch (error) {
    console.error('Error:', error);
    return {
      statusCode: 500,
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        success: false,
        error: error.message
      })
    };
  }
};
