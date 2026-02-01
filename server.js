const express = require('express');
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Directory for API keys and files
const API_STORAGE_DIR = path.join(__dirname, 'apibot');

// Ensure apibot directory exists
if (!fs.existsSync(API_STORAGE_DIR)) {
  fs.mkdirSync(API_STORAGE_DIR, { recursive: true });
}

// Generate unique API key
function generateApiKey() {
  return crypto.randomBytes(16).toString('hex');
}

// Generate unique path suffix
function generateRandomSuffix() {
  return crypto.randomBytes(8).toString('hex');
}

// Create API endpoint directory structure
function createApiStructure(apiKey) {
  const apiDir = path.join(API_STORAGE_DIR, apiKey);
  const v1Dir = path.join(apiDir, 'v1');
  
  if (!fs.existsSync(apiDir)) {
    fs.mkdirSync(apiDir, { recursive: true });
  }
  
  if (!fs.existsSync(v1Dir)) {
    fs.mkdirSync(v1Dir, { recursive: true });
  }
  
  return { apiDir, v1Dir };
}

// ========== API ROUTES (đặt trước general routes) ==========

// Create a new raw link
app.post('/api/create-link', (req, res) => {
  try {
    const { content = '', contentType = 'text/plain' } = req.body;
    
    // Generate new API key
    const apiKey = generateApiKey();
    const randomSuffix = generateRandomSuffix();
    
    // Create directory structure
    const { v1Dir } = createApiStructure(apiKey);
    
    // Create content file
    const fileName = `${randomSuffix}.txt`;
    const filePath = path.join(v1Dir, fileName);
    
    // Store content with metadata
    const fileData = {
      timestamp: new Date().toISOString(),
      contentType,
      content
    };
    
    fs.writeFileSync(filePath, JSON.stringify(fileData, null, 2));
    
    // Generate the raw link
    const protocol = process.env.PROTOCOL || 'http';
    const domain = process.env.DOMAIN || 'localhost:3000';
    const rawLink = `${protocol}://${domain}/${apiKey}/v1/${randomSuffix}`;
    
    res.json({
      success: true,
      apiKey,
      randomSuffix,
      link: rawLink,
      filePath: `/apibot/${apiKey}/v1/${fileName}`
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: error.message
    });
  }
});

// Get link info (metadata)
app.get('/api/link-info/:apiKey/:randomId', (req, res) => {
  try {
    const { apiKey, randomId } = req.params;
    
    const filePath = path.join(API_STORAGE_DIR, apiKey, 'v1', `${randomId}.txt`);
    
    if (!filePath.startsWith(API_STORAGE_DIR)) {
      return res.status(403).json({ error: 'Forbidden' });
    }
    
    if (!fs.existsSync(filePath)) {
      return res.status(404).json({ error: 'Link not found' });
    }
    
    const fileContent = fs.readFileSync(filePath, 'utf-8');
    const data = JSON.parse(fileContent);
    
    res.json({
      success: true,
      timestamp: data.timestamp,
      contentType: data.contentType,
      size: data.content.length,
      link: `http://localhost:3000/${apiKey}/v1/${randomId}`
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// List all links for an API key
app.get('/api/links/:apiKey', (req, res) => {
  try {
    const { apiKey } = req.params;
    
    const v1Dir = path.join(API_STORAGE_DIR, apiKey, 'v1');
    
    if (!fs.existsSync(v1Dir)) {
      return res.json({ success: true, links: [] });
    }
    
    const files = fs.readdirSync(v1Dir);
    const links = files
      .filter(f => f.endsWith('.txt'))
      .map(f => {
        const randomId = f.replace('.txt', '');
        const protocol = process.env.PROTOCOL || 'http';
        const domain = process.env.DOMAIN || 'localhost:3000';
        
        const filePath = path.join(v1Dir, f);
        const fileContent = fs.readFileSync(filePath, 'utf-8');
        const data = JSON.parse(fileContent);
        
        return {
          randomId,
          link: `${protocol}://${domain}/${apiKey}/v1/${randomId}`,
          timestamp: data.timestamp,
          contentType: data.contentType,
          size: data.content.length
        };
      });
    
    res.json({ success: true, apiKey, links });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// ========== GENERAL RAW CONTENT ROUTE (đặt sau API routes) ==========

// Retrieve raw content via link
app.get('/:apiKey/v1/:randomId', (req, res) => {
  try {
    const { apiKey, randomId } = req.params;
    
    const filePath = path.join(API_STORAGE_DIR, apiKey, 'v1', `${randomId}.txt`);
    
    // Security check: ensure file is within apibot directory
    if (!filePath.startsWith(API_STORAGE_DIR)) {
      return res.status(403).json({ error: 'Forbidden' });
    }
    
    if (!fs.existsSync(filePath)) {
      return res.status(404).json({ error: 'Link not found' });
    }
    
    const fileContent = fs.readFileSync(filePath, 'utf-8');
    const data = JSON.parse(fileContent);
    
    // Return as raw content
    res.setHeader('Content-Type', data.contentType || 'text/plain');
    res.send(data.content);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Serve static files (MUST BE LAST)
app.use(express.static('public'));

app.listen(PORT, () => {
  console.log(`✓ Server running at http://localhost:${PORT}`);
  console.log(`✓ API storage directory: ${API_STORAGE_DIR}`);
});
