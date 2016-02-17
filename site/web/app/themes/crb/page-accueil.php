<?php
/**
 * Template Name: Page d'accueil
 */
?>
<div class="wrapper" ng-controller="searchController as main">

	<header class="mainheader">

		<div class="container">

			<div class="wrap">

				<?php while (have_posts()) : the_post(); ?>
				<div class="text">
				  <?php //get_template_part('templates/page', 'header'); ?>
				  <h1 class="display-2"><i class="icon-logo_fr"></i><br><?php bloginfo('name'); ?> <small class="sr-only">Région Bretagne</small></h1>
				  <?php bloginfo('slogan'); ?>
				  <?php get_template_part('templates/content', 'page'); ?>
				 </div>
				<?php endwhile; ?>
			


				<form class="searchform">

					<div class="form-group">
					    
					    <label for="search" class="form-label sr-only">Effectuez votre recherche</label>

						<angucomplete-alt id="search"
			              placeholder="Effectuez votre recherche"
			              pause="200"
			              minlength="2"
			              selected-object="main.search.tags"
			              local-data="main.etiquettes"
			              search-fields="name"
		          		  title-field="name"
			              description-field="description"
			              input-class="form-control form-control-lg" 
			              match-class="highlight"
						  override-suggestions="true"
						  />

					</div>

				</form>
				<div class="text infos">
					
				</div>
			</div>
		</div>

	</header>

	<section class="section results">

		<div class="container">

			<div class="row">

				<div class="col-md-4 col-md-push-8">

					<h2>Filtres</h2>
					
					<form class="filters" id="filters" >
						<div class="form-group" data-group="profils">
							<!-- <div class="checkbox">
								<label>
								  <input type="checkbox" value="*" checked> Tous les profils
								</label>
							</div> -->
							<div class="checkbox" ng-repeat="profil in main.profils" >
								<label>
								  <input type="checkbox" checklist-model="main.search.profils" checklist-value="profil.id"> <span ng-bind-html="profil.name"></span>
								</label>
							</div>
						</div>
						<hr>
						<div class="form-group" data-group="thematiques">
							<!-- <div class="checkbox">
								<label>
								  <input type="checkbox" value="*" checked> Toutes les thématiques
								</label>
							</div> -->
							<div class="checkbox" ng-repeat="thematique in main.thematiques">
								<label>
								  <input type="checkbox" checklist-model="main.search.thematiques" checklist-value="thematique.id"> <span ng-bind-html="thematique.name"></span>
								</label>
							</div>
						</div>
					</form> 
					
				</div> <!-- col -->

				<div class="col-md-8 col-md-pull-4">

					<ul id="" class="list-unstyled list-results">

						<li ng-repeat='aide in main.aides | filter:{tags: main.search.tags.originalObject.id}:true | arrayFilter:{profil:main.search.profils} | arrayFilter:{thematique:main.search.thematiques} | orderBy:"-id" track by $index' class="list-item" ng-class="[main.getClass(aide.acf.profil), main.getClass(aide.acf.thematiques)]">

							<article class="list-item-wrap aide-excerpt">
								<header class="aide-header">
									<ul class="nav nav-inline pull-right">
										<li ng-repeat="aidethematique in aide.acf.thematiques" class="nav-item"><small class="text-muted" ng-bind-html="aidethematique.name"></small></li>
									</ul>
									<h2 class="aide-title" ng-bind-html="aide.title.rendered"></h2>
									<ul class="nav nav-inline">
										<li ng-repeat="aideprofil in aide.acf.profil" class="nav-item"><span class="label label-default" ng-bind-html="aideprofil.name"></span></li>
									</ul>
								</header>
								<p ng-bind-html="aide.excerpt.rendered"></p>
								
								<footer>
								</footer>
								<p class="text-md-right"><a ng-href="{{ aide.link }}">consulter &#8594; </a></p>
							</article>
						</li>
					</ul>
					
				</div> <!-- col -->
			</div> <!-- row -->

		</div><!-- container -->
		

	</section>

</div>