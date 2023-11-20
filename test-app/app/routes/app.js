import Route from '@ember/routing/route';
import { inject as service } from '@ember/service';

export default class AppRoute extends Route {
  @service router;
  activate() {
    this.router.on('routeDidChange', (transition) => {
      window.parent.postMessage({
        path: transition.to.params.path
      },
        'http://localhost:4200'
      );
    });
  }
}
