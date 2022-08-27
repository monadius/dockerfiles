import daisy.lang._
import Real._

object SineApproximations {

  def input(x: Real): Real = {
    require(x > -3 && x < 3)
    x
  }

  def x3(x: Real): Real = {
    require(x > -3 && x < 3)
    3 * x
  }

  def constant(x: Real): Real = {
    require(x > -1 && x < 1)
    0.1
  }

  def constant1(x: Real): Real = {
    require(x > -1 && x < 1)
    1
  }
}

// https://tinyurl.com/fptaylor