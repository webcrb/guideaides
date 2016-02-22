<?php while (have_posts()) : the_post(); ?>
  <div class="section">
    <ol class="breadcrumb">
      <li><a href="<?php bloginfo('url'); ?>">Accueil</a></li>
      <li class="active">Aides &amp; dispositifs</li>
    </ol>
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
          <article <?php post_class(); ?>>
        
        <header class="aide-header">
          <h1 class="entry-title"><?php the_title(); ?></h1>
        </header>

        <p class="lead"><?php the_excerpt(); ?></p>


       
        <div class="entry-content">

          <div id="accordion" role="tablist" aria-multiselectable="true">
          
          <?php if( get_field('objectifs') ): ?>

          <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="heading-objectifs">
              <h2 class="panel-title">
                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#objectifs" aria-expanded="false" aria-controls="objectifs">
                  Objectifs
                </a>
              </h4>
            </div>

            <div id="objectifs" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading-objectifs">
              <?php the_field('objectifs'); ?>
            </div>
          </div>
          <?php endif; ?>
          
          <?php if( get_field('criteres') ): ?>
            
          <div class="panel panel-default">
            
            <div class="panel-heading" role="tab" id="heading-criteres">
              <h2 class="panel-title">
                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#criteres" aria-expanded="false" aria-controls="criteres">
                  Critères
                </a>
              </h4>
            </div>

            <div id="criteres" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading-criteres">
              <?php the_field('criteres'); ?>
            </div>

          </div>
          <?php endif; ?>
          
          <?php if( get_field('demarche') ): ?>
            
          <div class="panel panel-default">
            
            <div class="panel-heading" role="tab" id="heading-demarche">
              <h2 class="panel-title">
                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#demarche" aria-expanded="false" aria-controls="demarche">
                  Démarches
                </a>
              </h4>
            </div>

            <div id="demarche" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading-demarche">
              <?php the_field('demarche'); ?>
            </div>

          </div>
          <?php endif; ?>
          
          <?php if( get_field('informations') ): ?>
            
          <div class="panel panel-default">
            
            <div class="panel-heading" role="tab" id="heading-informations">
              <h2 class="panel-title">
                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#informations" aria-expanded="false" aria-controls="informations">
                  Contacts
                </a>
              </h4>
            </div>

            <div id="informations" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading-informations">
              <?php the_field('informations'); ?>
            </div>
          </div>
          <?php endif; ?>

          </div><!-- accordion -->

        </div> <!-- entry -->
       
        <footer class="aide-footer">
         <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum nesciunt dicta, sequi nostrum. Consequuntur, at, voluptatum! Nostrum accusamus iste, saepe perspiciatis quidem consectetur delectus officiis. Nemo alias minus ut cumque.</p>
        </footer>

      </article>

      </div> <!-- col -->
     
      <div class="col-md-4">
         <aside class="encadre">
            <h2>Contenus secondaires</h2>
            <hr>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur impedit nisi, sapiente ullam at necessitatibus iure, soluta. Labore porro placeat sed soluta, fugit velit, omnis, possimus necessitatibus dolores error aspernatur.</p>
        </aside>
      </div> <!-- col -->

      <div class="col-md-4">
         <aside class="encadre">
            <h2>Contenus secondaires</h2>
            <hr>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur impedit nisi, sapiente ullam at necessitatibus iure, soluta. Labore porro placeat sed soluta, fugit velit, omnis, possimus necessitatibus dolores error aspernatur.</p>
        </aside>
      </div> <!-- col -->

      <div class="col-md-4">
         <aside class="encadre">
            <h2>Contenus secondaires</h2>
            <hr>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur impedit nisi, sapiente ullam at necessitatibus iure, soluta. Labore porro placeat sed soluta, fugit velit, omnis, possimus necessitatibus dolores error aspernatur.</p>
        </aside>
      </div> <!-- col -->

    

      </div> <!-- row -->
  </div> <!-- section -->
<?php endwhile; ?>
