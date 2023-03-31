abstract class GiveawayStates {}

class GiveawayInitial extends GiveawayStates {}



class GiveawaysLoading extends GiveawayStates {}
class GiveawaysSuccess extends GiveawayStates {}
class GiveawaysError extends GiveawayStates {
  GiveawaysError(error);
}


class PlatformGiveawaysLoading extends GiveawayStates {}
class PlatformGiveawaysSuccess extends GiveawayStates {}
class PlatformGiveawaysError extends GiveawayStates {
  PlatformGiveawaysError(error);
}
