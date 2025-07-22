// src/index.ts

import "@strapi/types"; // Ensures core types are available

declare module "@strapi/strapi" {
  interface ContentTypes {
    "api::post.post": any;
    "api::blogpost.blogpost": any;
  }
}
