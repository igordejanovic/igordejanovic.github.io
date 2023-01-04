package BuildHouse {
    task buyLand {
    searchAds, chooseLand, buyLand
    next makePlan
    }
    task makePlan {
    searchforArchitect, giveInstructions, choosePlan
    next buildHouse
    }
    task buildHouse {
      buildHouse
    }
}
package BuildFence {
  task buildFence {
    chooseMaterial, buildFence
  }
}
