const soundsLikeQuestion = (text) => {
  return text.match(/\?\s*$/)
  // //
};

const soundsLikeShouting = (text) => {
  return !text.match(/[a-z]/) && text.match(/[A-Z]/)
};

const soundsLikeForcefullQuestion = (text)=>{
  return soundsLikeQuestion(text) &&  soundsLikeShouting(text)
}

const soundsLikeSilence = (text)=>{
  return text.trim() === ''
}

const iReallyDontCare = ()=>{
  return true

}


const rules = {
  "Whatever."                           :iReallyDontCare,
  "Sure."                               :soundsLikeQuestion,
  'Whoa, chill out!'                    :soundsLikeShouting,
  'Calm down, I know what I\'m doing!'  :soundsLikeForcefullQuestion,
  'Fine. Be that way!'                  :soundsLikeSilence

}

class Bob {
  hey(message) {
    return Object.keys(rules).reduce((accummulatedValue, response)=>{
      return rules[response](message) ? response : accummulatedValue

    })
  }
}

export default Bob;
