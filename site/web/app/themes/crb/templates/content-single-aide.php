<?php while (have_posts()) : the_post(); ?>
  <article <?php post_class(); ?>>
    <header>
      <h1 class="entry-title"><?php the_title(); ?></h1>
    </header>
    <div class="entry-content">
      <?php the_content(); ?>
      
      <?php if( get_field('objectifs') ): ?>

        <h2>Objectifs</h2>

        <div class="panel">
          <?php the_field('objectifs'); ?>
        </div>

      <?php endif; ?>
      
      <?php if( get_field('criteres') ): ?>
        
        <h2>Critères</h2>

        <div class="panel">
          <?php the_field('criteres'); ?>
        </div>

      <?php endif; ?>
      
      <?php if( get_field('demarche') ): ?>
        
        <h2>Démarches</h2>

        <div class="panel">
          <?php the_field('demarche'); ?>
        </div>

      <?php endif; ?>
      
      <?php if( get_field('informations') ): ?>
        
         <h2>Contacts</h2>

        <div class="panel">
          <?php the_field('informations'); ?>
        </div>

      <?php endif; ?>

    </div>
    <footer>
     
    </footer>

  </article>
<?php endwhile; ?>
