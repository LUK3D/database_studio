module.exports = {
    // site config
    lang: 'pt-PT',
    title: 'BackDev',
    description: 'This is my first VuePress site',
  
    // theme and its config
    theme: '@vuepress/theme-default',
    themeConfig: {
      logo: 'https://vuejs.org/images/logo.png',
      locales: {
        '/pt/': {
          selectLanguageName: 'Português',
          
        },
        '/en/': {
          selectLanguageName: 'English',
        },
      },

      nav: [
        { text: 'External', link: 'https://google.com', target:'_self', rel:false },
        { text: 'Guide', link: '/guide/', target:'_blank' }
      ],

      sidebar: [
        '/',
        {
            title: 'Servidor',   // required
            path: '/pt/servidor/',      // optional, link of the title, which should be an absolute path and must exist
            collapsable: true, // optional, defaults to true
            sidebarDepth: 0,    // optional, defaults to 1
            children: [
              '/pt/servidor/api'
            ]
            ,initialOpenGroupIndex: -1
          },
      ],

      
    },
  
    locales: {
        '/pt/': {
            lang: 'Português',
        },
        '/en/': {
            lang: 'English'
        },
        
    },
  }