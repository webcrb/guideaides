<?php
/**
 * Template Name: Page d'accueil
 */
?>
<div class="container">

	<?php while (have_posts()) : the_post(); ?>
	  <?php get_template_part('templates/page', 'header'); ?>
	  <?php get_template_part('templates/content', 'page'); ?>
	<?php endwhile; ?>
	
	<div ng-controller="searchController as main">
			<form>

				<div class="form-group">
				    <label class="sr-only" for="exampleInputEmail1">Recherche</label>
				    
				 
					<angucomplete-alt id="term"
		              placeholder="Entrez votre recherche"
		              pause="200"
		              minlength="2"
		              selected-object="term"
		              local-data="main.etiquettes.data"
		              search-fields="name"
              		  title-field="name"
		              description-field="description"
		              input-class="form-control form-control-lg"/>

				</div>

					
			</form>
			
			<ul class="row list-unstyled list-results">
				<li ng-repeat="aide in main.aides.data | filter:{ tags: term.originalObject.id }" class="col-md-4 list-item">
					<div class="list-item-wrap">
						<h2 class="h5" ng-bind-html="aide.title.rendered"></h2>
						<p ng-bind-html="aide.title.excerpt"></p>
						<p class="text-md-right"><a ng-href="{{ aide.link }}">consulter</a></p>
					</div>
				</li>
			</ul>

		</div>
	</div>
	
</div>